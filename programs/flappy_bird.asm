; flappy_bird.asm -- Flappy Bird for Geometry OS
; Controls: Space/W = flap, R = restart
; Bird affected by gravity, pipes scroll left with random gaps
; Score increments when bird passes a pipe pair
;
; Memory layout:
;   0x2000 = bird_y (fixed point *4, divide by 4 for pixel)
;   0x2001 = bird_vy (velocity, signed two's complement)
;   0x2002 = score
;   0x2003 = game_over (0=playing, 1=dead)
;   0x2004 = frame_counter
;   0x2005 = pipe_timer (frames until next pipe)
;   0x2006 = gravity accumulator
;   0x2100-0x213F = pipe array (8 pipes x 8 words each)
;     per pipe: [x, gap_y, active, passed, width, gap_height, _, _]
;   0x5000-0x50FF = text buffer for score/labels
;
; Register conventions:
;   r0 = CMP result ONLY (never use as general register)
;   r1-r6 = scratch / pointers / values
;   r7 = key code
;   r8 = constant 1
;   r9 = constant 0 (black)
;   r10 = text addr for TEXT opcode
;   r11 = text x for TEXT opcode
;   r12 = text y for TEXT opcode
;   r14 = BEEP frequency
;   r15 = BEEP duration
;   r20 = loop counter
;   r21 = slot counter
;   r22 = pointer / scratch
;   r23 = loaded value
;   r30 = SP
;   r31 = LR

; ── ENTRY / RESTART ────────────────────────────────────
restart:
  LDI r30, 0xFE00
  LDI r8, 1
  LDI r9, 0

  ; Init bird state
  LDI r4, 0x2000
  LDI r1, 400
  STORE r4, r1            ; bird_y = 400 (pixel 100)
  ADDI r4, 1
  STORE r4, r9            ; bird_vy = 0
  ADDI r4, 1
  STORE r4, r9            ; score = 0
  ADDI r4, 1
  STORE r4, r9            ; game_over = 0
  ADDI r4, 1
  STORE r4, r9            ; frame_counter = 0
  ADDI r4, 1
  LDI r1, 60
  STORE r4, r1            ; pipe_timer = 60
  ADDI r4, 1
  STORE r4, r9            ; gravity accumulator = 0

  ; Clear pipe array (64 words)
  LDI r20, 0x2100
  LDI r21, 64
clr_pipes:
  STORE r20, r9
  ADDI r20, 1
  SUBI r21, 1
  JNZ r21, clr_pipes

  ; Build "SCR:" label at 0x5000
  LDI r4, 0x5000
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 67
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 58
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r9

  JMP game_loop

; ── MAIN GAME LOOP ────────────────────────────────────
game_loop:
  ; Read input
  IKEY r7

  ; Check restart (R=82 or r=114)
  CMPI r7, 82
  JZ r0, restart
  CMPI r7, 114
  JZ r0, restart

  ; Check if game over
  LDI r4, 0x2003
  LOAD r1, r4
  JNZ r1, dead_loop

  ; ── FLAP INPUT (Space=32, W=87, w=119) ──────────────
  CMPI r7, 32
  JZ r0, do_flap
  CMPI r7, 87
  JZ r0, do_flap
  CMPI r7, 119
  JZ r0, do_flap
  JMP after_flap

do_flap:
  LDI r4, 0x2001
  LDI r1, 0xFFFFFFE4     ; -28 in two's complement (flap velocity)
  STORE r4, r1
  LDI r14, 600
  LDI r15, 30
  BEEP r14, r15

after_flap:
  ; ── GRAVITY (sub-pixel accumulator) ─────────────────
  LDI r4, 0x2006
  LOAD r1, r4
  ADDI r1, 2
  STORE r4, r1
  CMPI r1, 4
  BLT r0, grav_done
  ; accumulator >= 4, increment vy by 1
  LDI r4, 0x2001
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1
  LDI r4, 0x2006
  STORE r4, r9
grav_done:

  ; ── UPDATE BIRD POSITION ────────────────────────────
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r5, 0x2001
  LOAD r2, r5
  ADD r1, r2
  STORE r4, r1

  ; ── CHECK CEILING (bird_y < 0 signed) ───────────────
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r6, 0x80000000     ; sign bit
  AND r1, r6
  JZ r1, ceil_ok
  ; Bird above screen, clamp
  LDI r4, 0x2000
  STORE r4, r9
  LDI r4, 0x2001
  STORE r4, r9
ceil_ok:

  ; ── CHECK GROUND (bird_pixel_y >= 240) ──────────────
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r6, 2
  SAR r1, r6             ; r1 = bird_pixel_y
  CMPI r1, 240
  BLT r0, ground_ok
  ; Hit ground
  LDI r4, 0x2003
  LDI r1, 1
  STORE r4, r1
  LDI r14, 150
  LDI r15, 200
  BEEP r14, r15
  JMP dead_loop
ground_ok:

  ; ── FRAME COUNTER + PIPE TIMER ──────────────────────
  LDI r4, 0x2004
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1

  LDI r4, 0x2005
  LOAD r1, r4
  SUBI r1, 1
  STORE r4, r1
  JNZ r1, spawn_skip

  ; Timer expired, spawn new pipe
  PUSH r31
  CALL spawn_pipe
  POP r31

  ; Reset timer
  LDI r4, 0x2005
  LDI r1, 60
  STORE r4, r1

spawn_skip:
  ; ── UPDATE PIPES ────────────────────────────────────
  PUSH r31
  CALL update_pipes
  POP r31

  ; ── CHECK COLLISION ─────────────────────────────────
  PUSH r31
  CALL check_collision
  POP r31

  ; ── DRAW EVERYTHING ─────────────────────────────────
  FILL r9

  ; Ground line
  LDI r1, 0
  LDI r2, 242
  LDI r3, 256
  LDI r4, 14
  LDI r5, 0x8B4513
  RECTF r1, r2, r3, r4, r5

  ; Pipes
  PUSH r31
  CALL draw_pipes
  POP r31

  ; Bird
  PUSH r31
  CALL draw_bird
  POP r31

  ; HUD
  PUSH r31
  CALL draw_hud
  POP r31

  FRAME
  JMP game_loop

; ── DEAD LOOP (waiting for restart) ───────────────────
dead_loop:
  IKEY r7
  CMPI r7, 82
  JZ r0, restart
  CMPI r7, 114
  JZ r0, restart

  ; Redraw frozen scene
  FILL r9

  ; Ground
  LDI r1, 0
  LDI r2, 242
  LDI r3, 256
  LDI r4, 14
  LDI r5, 0x8B4513
  RECTF r1, r2, r3, r4, r5

  PUSH r31
  CALL draw_pipes
  POP r31
  PUSH r31
  CALL draw_bird
  POP r31
  PUSH r31
  CALL draw_hud
  POP r31

  ; "GAME OVER" at (80, 100)
  LDI r4, 0x5020
  LDI r1, 71
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 65
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 77
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 79
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 86
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r9

  LDI r10, 0x5020
  LDI r11, 80
  LDI r12, 100
  TEXT r11, r12, r10

  ; "PRESS R" at (90, 120)
  LDI r4, 0x5040
  LDI r1, 80
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 69
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 83
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 32
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 82
  STORE r4, r1
  ADDI r4, 1
  STORE r4, r9

  LDI r10, 0x5040
  LDI r11, 90
  LDI r12, 120
  TEXT r11, r12, r10

  FRAME
  JMP dead_loop

; ── SPAWN PIPE ────────────────────────────────────────
; Find empty pipe slot and fill it with random gap position
spawn_pipe:
  LDI r20, 0x2100
  LDI r21, 8
sp_find:
  JZ r21, sp_done
  MOV r22, r20
  ADDI r22, 2
  LOAD r23, r22
  JZ r23, sp_found
  ADDI r20, 8
  SUBI r21, 1
  JMP sp_find
sp_found:
  ; x = 256 (just off right edge)
  LDI r1, 256
  STORE r20, r1
  ; Random gap_y in range 50..180
  RAND r1
  ANDI r1, 0x7F          ; 0..127
  ADDI r1, 50            ; 50..177
  ; Clamp to max 180
  CMPI r1, 180
  BLT r0, sp_gap_ok
  LDI r1, 180
sp_gap_ok:
  MOV r22, r20
  ADDI r22, 1
  STORE r22, r1           ; gap_y
  ; active = 1
  MOV r22, r20
  ADDI r22, 2
  LDI r1, 1
  STORE r22, r1
  ; passed = 0
  MOV r22, r20
  ADDI r22, 3
  STORE r22, r9
  ; width = 20
  MOV r22, r20
  ADDI r22, 4
  LDI r1, 20
  STORE r22, r1
  ; gap_height = 48
  MOV r22, r20
  ADDI r22, 5
  LDI r1, 48
  STORE r22, r1
sp_done:
  RET

; ── UPDATE PIPES ──────────────────────────────────────
; Move all active pipes left by 2 pixels per frame
update_pipes:
  LDI r20, 0x2100
  LDI r21, 8
up_lp:
  JZ r21, up_done
  ; Check if active
  MOV r22, r20
  ADDI r22, 2
  LOAD r23, r22
  JZ r23, up_next

  ; Move pipe left: x -= 2
  LOAD r1, r20
  SUBI r1, 2
  STORE r20, r1

  ; Check if off screen (x > 280 means unsigned wrapped)
  CMPI r1, 280
  BLT r0, up_scorechk
  ; Off screen, deactivate
  MOV r22, r20
  ADDI r22, 2
  STORE r22, r9
  JMP up_next

up_scorechk:
  ; Score check: pipe_x + width < 40 (BIRD_X) and not yet passed
  MOV r22, r20
  ADDI r22, 4
  LOAD r23, r22           ; width
  ADD r23, r1             ; pipe_x + width
  CMPI r23, 40
  BGE r0, up_next         ; still to the right of bird

  ; Already scored?
  MOV r22, r20
  ADDI r22, 3
  LOAD r23, r22
  JNZ r23, up_next

  ; Score this pipe
  MOV r22, r20
  ADDI r22, 3
  LDI r1, 1
  STORE r22, r1

  ; Increment score
  LDI r4, 0x2002
  LOAD r1, r4
  ADDI r1, 1
  STORE r4, r1

  ; Score sound
  LDI r14, 880
  LDI r15, 60
  BEEP r14, r15

up_next:
  ADDI r20, 8
  SUBI r21, 1
  JMP up_lp
up_done:
  RET

; ── CHECK COLLISION ───────────────────────────────────
; Test bird rectangle against each active pipe's top/bottom sections
check_collision:
  LDI r20, 0x2100
  LDI r21, 8
cc_lp:
  JZ r21, cc_done
  ; Check if active
  MOV r22, r20
  ADDI r22, 2
  LOAD r23, r22
  JZ r23, cc_next

  ; Load pipe data
  LOAD r11, r20           ; pipe_x
  MOV r22, r20
  ADDI r22, 1
  LOAD r12, r22           ; gap_y (pixel)
  ADDI r22, 2
  ADDI r22, 1
  LOAD r13, r22           ; width
  ADDI r22, 1
  LOAD r23, r22           ; gap_height

  ; Bird pixel y
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r6, 2
  SAR r1, r6              ; r1 = bird_pixel_y

  ; Horizontal overlap: pipe_x < 46 AND pipe_x+width > 40
  CMPI r11, 46
  BGE r0, cc_next         ; pipe_x >= 46, no overlap

  MOV r6, r11
  ADD r6, r13             ; r6 = pipe_x + width
  CMPI r6, 41
  BLT r0, cc_next         ; pipe_x + width <= 40, no overlap

  ; Horizontal overlap confirmed. Check vertical.
  ; Collision if bird_y < gap_y OR bird_y + 6 > gap_y + gap_height

  ; Check above gap: bird_y < gap_y
  CMP r1, r12
  BGE r0, cc_below        ; bird_y >= gap_y, check below
  ; Bird above gap -> collision
  JMP cc_hit

cc_below:
  ; Check below gap: bird_y + 6 > gap_y + gap_height
  ADDI r1, 6              ; bird_bottom = bird_y + BIRD_SIZE
  MOV r6, r12
  ADD r6, r23             ; gap_bottom = gap_y + gap_height
  CMP r1, r6
  BLT r0, cc_next         ; bird_bottom < gap_bottom -> safe, in gap
  ; Bird below gap -> collision

cc_hit:
  LDI r4, 0x2003
  LDI r1, 1
  STORE r4, r1
  LDI r14, 150
  LDI r15, 200
  BEEP r14, r15
  JMP cc_done

cc_next:
  ADDI r20, 8
  SUBI r21, 1
  JMP cc_lp
cc_done:
  RET

; ── DRAW PIPES ────────────────────────────────────────
draw_pipes:
  LDI r20, 0x2100
  LDI r21, 8
dp_lp:
  JZ r21, dp_done
  ; Check if active
  MOV r22, r20
  ADDI r22, 2
  LOAD r23, r22
  JZ r23, dp_next

  ; Load pipe data
  LOAD r11, r20           ; pipe_x
  MOV r22, r20
  ADDI r22, 1
  LOAD r12, r22           ; gap_y
  ADDI r22, 2
  ADDI r22, 1
  LOAD r13, r22           ; width
  ADDI r22, 1
  LOAD r23, r22           ; gap_height

  ; Skip if pipe_x >= 256 (off screen right)
  CMPI r11, 256
  BGE r0, dp_next

  ; ── Top pipe: from y=0 to gap_y ────────────────────
  MOV r1, r11             ; x = pipe_x
  LDI r2, 0               ; y = 0
  MOV r3, r13             ; w = width
  MOV r4, r12             ; h = gap_y
  LDI r5, 0x228B22        ; forest green
  RECTF r1, r2, r3, r4, r5

  ; Top pipe cap (darker, 2px wider each side)
  MOV r1, r11
  SUBI r1, 2              ; x = pipe_x - 2 (could underflow if pipe_x < 2, but that's fine near edge)
  MOV r6, r12
  SUBI r6, 4              ; y = gap_y - 4
  MOV r3, r13
  ADDI r3, 4              ; w = width + 4
  LDI r4, 4               ; h = 4
  LDI r5, 0x006400        ; dark green
  RECTF r1, r6, r3, r4, r5

  ; ── Bottom pipe: from gap_y+gap_height to ground ───
  MOV r1, r11             ; x = pipe_x
  MOV r2, r12
  ADD r2, r23             ; y = gap_y + gap_height
  MOV r3, r13             ; w = width
  LDI r4, 242
  ; h = 242 - (gap_y + gap_height)
  SUB r4, r2              ; r4 = 242 - y
  LDI r5, 0x228B22
  RECTF r1, r2, r3, r4, r5

  ; Bottom pipe cap
  MOV r1, r11
  SUBI r1, 2              ; x = pipe_x - 2
  MOV r2, r12
  ADD r2, r23             ; y = gap_y + gap_height
  MOV r3, r13
  ADDI r3, 4              ; w = width + 4
  LDI r4, 4               ; h = 4
  LDI r5, 0x006400
  RECTF r1, r2, r3, r4, r5

dp_next:
  ADDI r20, 8
  SUBI r21, 1
  JMP dp_lp
dp_done:
  RET

; ── DRAW BIRD ─────────────────────────────────────────
draw_bird:
  ; Bird pixel y = bird_y / 4 (arithmetic shift right 2)
  LDI r4, 0x2000
  LOAD r1, r4
  LDI r6, 2
  SAR r1, r6              ; r1 = bird_pixel_y

  ; Body: 6x6 yellow rect at (40, bird_y)
  LDI r2, 40              ; x = BIRD_X
  MOV r3, r1              ; y = bird_pixel_y
  LDI r4, 6               ; w
  LDI r5, 6               ; h
  LDI r6, 0xFFD700        ; gold
  RECTF r2, r3, r4, r5, r6

  ; Eye: white pixel at (44, bird_y+1)
  LDI r2, 44
  MOV r3, r1
  ADDI r3, 1              ; eye_y
  LDI r5, 0xFFFFFF
  PSET r2, r3, r5

  ; Beak: orange pixel at (46, bird_y+2)
  LDI r2, 46
  MOV r3, r1
  ADDI r3, 2
  LDI r5, 0xFF8C00
  PSET r2, r3, r5

  RET

; ── DRAW HUD (score) ──────────────────────────────────
draw_hud:
  ; Convert score to ASCII decimal at 0x5004
  LDI r4, 0x2002
  LOAD r1, r4             ; r1 = score

  ; Cap at 99
  CMPI r1, 100
  BLT r0, hud_tens
  LDI r1, 99

hud_tens:
  ; Divide by 10 via repeated subtraction
  LDI r2, 0               ; tens digit
hud_tdiv:
  CMPI r1, 10
  BLT r0, hud_ones
  SUBI r1, 10
  ADDI r2, 1
  JMP hud_tdiv

hud_ones:
  ; r2 = tens, r1 = ones
  ADDI r2, 48             ; ASCII '0' + tens
  ADDI r1, 48             ; ASCII '0' + ones

  ; Store digits after "SCR:"
  LDI r4, 0x5004
  STORE r4, r2
  ADDI r4, 1
  STORE r4, r1
  ADDI r4, 1
  LDI r1, 0
  STORE r4, r1            ; null terminator

  ; Render score text
  LDI r10, 0x5000
  LDI r11, 4
  LDI r12, 4
  TEXT r11, r12, r10

  RET
