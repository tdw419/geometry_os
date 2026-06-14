; rain.asm -- Rain Simulation with Splash and Lightning Effects
;
; Demonstrates:
;   1. Falling rain drops with varied speeds and lengths
;   2. Splash effect on bottom edge
;   3. Lightning flash effect using FILL
;
; Memory layout:
;   0x2000..0x27FF: rain drop pool (128 drops x 4 words)
;     Per drop: x, y, speed, length
;   0x2800..0x2BFF: splash pool (128 splashes x 4 words)
;     Per splash: x, y, life, vx
;   0x2C00: frame_counter (u32)
;   0x2C01: lightning_timer (u32, countdown to next flash)
;   0x2C02: lightning_flash (u32, 0=no flash, 1=white flash, 2=fade)
;   0x2C03: lightning_x (u32, x position of lightning bolt)
;   0x2C04: lightning_y (u32, current y of bolt drawing)
;
; Controls: None (automatic)
; Uses: FILL, FRAME, PSET, LINE, RAND, RECTF, SCROLL

; ===== Constants =====
LDI r7, 1
LDI r20, 4              ; drop stride (words per drop)
LDI r21, 128            ; max drops
LDI r22, 0x2000         ; drop pool base
LDI r23, 4              ; splash stride
LDI r24, 128            ; max splashes
LDI r25, 0x2800         ; splash pool base
LDI r26, 0              ; zero constant
LDI r27, 0xFF           ; byte mask
LDI r30, 0xFF00         ; stack pointer

; ===== Initialize State =====
LDI r17, 0x2C00
LDI r18, 0
STORE r17, r18          ; frame_counter = 0
ADD r17, r7
LDI r18, 60
STORE r17, r18          ; lightning_timer = 60 (first flash at frame 60)
ADD r17, r7
LDI r18, 0
STORE r17, r18          ; lightning_flash = 0
ADD r17, r7
LDI r18, 0
STORE r17, r18          ; lightning_x = 0
ADD r17, r7
LDI r18, 0
STORE r17, r18          ; lightning_y = 0

; ===== Initialize Rain Drops =====
LDI r1, 0
init_drops:
  CALL calc_drop_addr
  CALL randomize_drop
  ADD r1, r7
  LDI r17, 128
  CMP r1, r17
  BLT r0, init_drops

; ===== Main Loop =====
main_loop:
  ; Increment frame counter
  LDI r17, 0x2C00
  LOAD r18, r17
  ADD r18, r7
  STORE r17, r18

  ; Clear screen to dark blue-gray (night sky)
  LDI r8, 0x0A0A14
  FILL r8

  ; ---- Update and draw rain drops ----
  LDI r1, 0
update_drops:
  LDI r17, 128
  CMP r1, r17
  BGE r0, drops_done

  CALL calc_drop_addr

  ; Load drop data
  LOAD r3, r2           ; x
  LDI r14, 1
  ADD r14, r2
  LOAD r4, r14          ; y
  LDI r14, 2
  ADD r14, r2
  LOAD r5, r14          ; speed (1..4)
  LDI r14, 3
  ADD r14, r2
  LOAD r6, r14          ; length (2..6)

  ; Move drop down by speed
  ADD r4, r5

  ; Check if drop hit bottom (y + length >= 254)
  MOV r15, r4
  ADD r15, r6
  LDI r17, 254
  CMP r15, r17
  BGE r0, drop_splash

  ; Draw rain drop as a vertical line (streak)
  ; Color: light blue 0x4488CC with slight variation
  LDI r8, 0x4488CC
  ; Top pixel
  PSET r3, r4, r8

  ; Draw the streak (length pixels going up from y)
  MOV r10, r6
  MOV r11, r4           ; current y for streak
streak_loop:
  LDI r17, 1
  CMP r10, r17
  BGE r0, streak_draw
  JMP streak_done
streak_draw:
  ; Fade color for trail: dimmer blue further from tip
  MOV r12, r6
  SUB r12, r10
  SHLI r12, 5           ; fade factor * 32
  LDI r13, 0x4488CC
  ; Simple fade: shift right by fade amount (clamped to 3 max)
  LDI r17, 3
  CMP r12, r17
  BLT r0, no_clamp_fade
  MOV r12, r17
no_clamp_fade:
  MOV r9, r13
  SHR r9, r12
  PSET r3, r11, r9
  SUBI r11, 1           ; move up the streak
  SUBI r10, 1
  LDI r17, 0
  CMP r10, r17
  BGE r0, streak_loop
streak_done:

  ; Store updated drop position
  STORE r2, r3          ; x unchanged
  LDI r14, 1
  ADD r14, r2
  STORE r14, r4         ; y updated
  JMP next_drop

drop_splash:
  ; Create splash at drop x position
  CALL create_splash
  ; Reset drop to top
  CALL randomize_drop
  ; Force y to 0 area (randomize sets it, but ensure top)
  LOAD r3, r2           ; x
  LDI r14, 1
  ADD r14, r2
  LDI r18, 0
  STORE r14, r18        ; y = 0

next_drop:
  ADD r1, r7
  JMP update_drops

drops_done:

  ; ---- Update and draw splashes ----
  LDI r1, 0
update_splashes:
  LDI r17, 128
  CMP r1, r17
  BGE r0, splashes_done

  CALL calc_splash_addr

  ; Load splash data
  LOAD r3, r2           ; x
  LDI r14, 1
  ADD r14, r2
  LOAD r4, r14          ; y
  LDI r14, 2
  ADD r14, r2
  LOAD r5, r14          ; life (counts down from 8)
  LDI r14, 3
  ADD r14, r2
  LOAD r6, r14          ; vx (horizontal spread direction)

  ; Skip inactive splashes
  LDI r17, 0
  CMP r5, r17
  JZ r0, next_splash

  ; Move splash outward and up
  ADD r3, r6             ; x += vx
  ; y moves up as splash expands
  SUBI r4, 1

  ; Decrement life
  SUBI r5, 1

  ; Store updated splash
  STORE r2, r3
  LDI r14, 1
  ADD r14, r2
  STORE r14, r4
  LDI r14, 2
  ADD r14, r2
  STORE r14, r5

  ; Draw splash particle (bright cyan-white, fading with life)
  ; Color intensity based on remaining life
  LDI r8, 0x88BBDD
  LDI r17, 4
  CMP r5, r17
  BLT r0, splash_dim
  LDI r8, 0xCCDDFF
splash_dim:
  LDI r17, 2
  CMP r5, r17
  BLT r0, splash_very_dim
  JMP splash_draw
splash_very_dim:
  LDI r8, 0x556688
splash_draw:
  ; Only draw if still on screen
  LDI r17, 256
  CMP r3, r17
  BGE r0, next_splash
  LDI r17, 0
  CMP r4, r17
  BLT r0, next_splash
  PSET r3, r4, r8

next_splash:
  ADD r1, r7
  JMP update_splashes

splashes_done:

  ; ---- Lightning flash ----
  ; Check if it is time for lightning
  LDI r17, 0x2C01
  LOAD r18, r17
  SUBI r18, 1
  STORE r17, r18

  LDI r17, 0
  CMP r18, r17
  BGE r0, no_lightning_trigger

  ; Trigger lightning!
  LDI r17, 0x2C02
  LDI r18, 1
  STORE r17, r18         ; flash = 1

  ; Random x position for bolt (40..215)
  LDI r17, 0x2C03
  RAND r18
  ANDI r18, 0xC0         ; 0, 64, 128, 192
  ADDI r18, 40            ; 40, 104, 168, 232
  STORE r17, r18

  ; Reset y to 0
  LDI r17, 0x2C04
  LDI r18, 0
  STORE r17, r18

  ; Reset timer (120..280 frames = 2-4.7 seconds at 60fps)
  LDI r17, 0x2C01
  RAND r18
  ANDI r18, 0x7F
  ADDI r18, 120
  STORE r17, r18

no_lightning_trigger:

  ; Process lightning flash state
  LDI r17, 0x2C02
  LOAD r18, r17

  LDI r19, 0
  CMP r18, r19
  JZ r0, no_flash

  LDI r19, 1
  CMP r18, r19
  JNZ r0, flash_fade

  ; Flash frame 1: bright white flash
  LDI r8, 0x444466
  FILL r8
  ; Draw lightning bolt as bright LINE segments
  LDI r17, 0x2C03
  LOAD r10, r17          ; x start
  LDI r17, 0x2C04
  LOAD r11, r17          ; y start

  ; Draw bolt as zigzag going down
  LDI r9, 0xDDDDFF      ; bright white-blue
  ; Segment 1
  MOV r12, r10
  ADDI r12, 12           ; x offset for zigzag
  LDI r13, 80            ; y end
  LINE r10, r11, r12, r13, r9
  ; Segment 2
  MOV r10, r12
  MOV r11, r13
  SUBI r12, 20
  LDI r13, 160
  LINE r10, r11, r12, r13, r9
  ; Segment 3
  MOV r10, r12
  MOV r11, r13
  ADDI r12, 16
  LDI r13, 240
  LINE r10, r11, r12, r13, r9
  ; Draw bright glow around bolt (ground impact)
  LDI r8, 0xCCCCFF
  PSET r12, r13, r8
  SUBI r12, 1
  PSET r12, r13, r8
  ADDI r12, 2
  PSET r12, r13, r8

  ; Advance flash state to fade
  LDI r17, 0x2C02
  LDI r18, 2
  STORE r17, r18
  JMP no_flash

flash_fade:
  ; Flash frame 2+: draw bolt without full flash (dimmer)
  LDI r17, 0x2C03
  LOAD r10, r17
  LDI r11, 0

  ; Draw dimmer bolt
  LDI r9, 0x6666AA
  MOV r12, r10
  ADDI r12, 12
  LDI r13, 80
  LINE r10, r11, r12, r13, r9
  MOV r10, r12
  MOV r11, r13
  SUBI r12, 20
  LDI r13, 160
  LINE r10, r11, r12, r13, r9
  MOV r10, r12
  MOV r11, r13
  ADDI r12, 16
  LDI r13, 240
  LINE r10, r11, r12, r13, r9

  ; End flash after 3 frames of fade
  LDI r17, 0x2C02
  LOAD r18, r17
  ADDI r18, 1
  STORE r17, r18
  LDI r17, 5
  CMP r18, r17
  BGE r0, end_flash
  JMP no_flash

end_flash:
  LDI r17, 0x2C02
  LDI r18, 0
  STORE r17, r18

no_flash:

  ; Draw ground line (dark horizon)
  LDI r8, 0x141420
  LDI r4, 254
  LDI r3, 0
ground_line:
  PSET r3, r4, r8
  ADD r3, r7
  LDI r17, 256
  CMP r3, r17
  BLT r0, ground_line

  FRAME
  JMP main_loop

; ===== calc_drop_addr =====
; Sets r2 = 0x2000 + r1 * 4
calc_drop_addr:
  MOV r2, r1
  MUL r2, r20
  ADD r2, r22
  RET

; ===== calc_splash_addr =====
; Sets r2 = 0x2800 + r1 * 4
calc_splash_addr:
  MOV r2, r1
  MUL r2, r23
  ADD r2, r25
  RET

; ===== randomize_drop =====
; Randomizes drop at address r2
; Drop: x, y, speed, length
randomize_drop:
  ; x = RAND & 0xFF (0..255)
  RAND r3
  AND r3, r27
  STORE r2, r3
  ADD r2, r7

  ; y = RAND & 0xFF (0..255, random start position)
  RAND r3
  AND r3, r27
  STORE r2, r3
  ADD r2, r7

  ; speed = 1 + (RAND & 3) = 1..4
  RAND r3
  ANDI r3, 3
  ADDI r3, 1
  STORE r2, r3
  ADD r2, r7

  ; length = 2 + (RAND & 7) = 2..9
  RAND r3
  ANDI r3, 7
  ADDI r3, 2
  STORE r2, r3

  RET

; ===== create_splash =====
; Creates splash particles at drop position (r3=x)
; Finds a free splash slot and spawns 3-4 splash particles
create_splash:
  PUSH r31
  PUSH r3               ; save drop x

  ; Create 3 splash particles at different angles
  LDI r10, 3
splash_create_loop:
  ; Find free splash slot
  LDI r1, 0
find_splash_slot:
  LDI r17, 128
  CMP r1, r17
  BGE r0, splash_create_done
  CALL calc_splash_addr
  LDI r14, 2
  ADD r14, r2
  LOAD r18, r14         ; life
  LDI r17, 0
  CMP r18, r17
  JZ r0, found_splash_slot
  ADD r1, r7
  JMP find_splash_slot

found_splash_slot:
  POP r3                 ; restore drop x
  PUSH r3                ; save again for next iteration

  ; x = drop x + random offset (-2..+2)
  RAND r18
  ANDI r18, 7
  SUBI r18, 3            ; -3..+3
  ADD r3, r18
  AND r3, r27            ; clamp to 0..255
  STORE r2, r3
  ADD r2, r7

  ; y = 253 (just above ground)
  LDI r18, 253
  STORE r2, r18
  ADD r2, r7

  ; life = 6 + (RAND & 3) = 6..9
  RAND r18
  ANDI r18, 3
  ADDI r18, 6
  STORE r2, r18
  ADD r2, r7

  ; vx = random direction (-2..+2, but not 0)
  RAND r18
  ANDI r18, 3            ; 0..3
  ADDI r18, 1            ; 1..4
  ; Randomly negate
  RAND r19
  ANDI r19, 1
  JZ r19, splash_vx_pos
  NEG r18
splash_vx_pos:
  STORE r2, r18

  SUBI r10, 1
  LDI r17, 0
  CMP r10, r17
  BGE r0, splash_create_done

  ; Continue loop
  POP r3
  PUSH r3
  JMP splash_create_loop

splash_create_done:
  POP r3                 ; clean up saved x
  POP r31
  RET
