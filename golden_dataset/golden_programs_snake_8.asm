; DESCRIPTION: A colored rectangle centered at the screen with fixed size.

; snake.asm -- Snake game on a 32x32 cell grid (8px per cell = 256x256)
;
; Memory layout (all RAM addresses):
;   0x2000..0x21FF  body ring buffer: each cell = (x<<8)|y, 512 slots
;   0x2200          head index (into ring buffer)
;   0x2201          tail index
;   0x2202          length
;   0x2203          apple_x (cell coords, 0-31)
;   0x2204          apple_y
;   0x2205          direction (0=up 1=right 2=down 3=left)
;   0x2206          game_over flag
;
; Stack: r30 = SP, initialized to 0x8000 (grows down into safe RAM)
;
; Controls: WASD (also lowercase)

; ── restart / init ──────────────────────────────────────────────
restart:
  LDI r30, 0x8000     ; stack pointer

  ; write initial snake: (14,16) (15,16) (16,16) at indices 0,1,2
  LDI r8, 0x2000
  LDI r5, 8

  LDI r12, 14
  SHL r12, r5
  LDI r14, 16
  OR r12, r14
  STORE r8, r12        ; body[0] = (14,16)

  LDI r12, 15
  SHL r12, r5
  OR r12, r14
  LDI r8, 0x2001
  STORE r8, r12        ; body[1] = (15,16)

  LDI r12, 16
  SHL r12, r5
  OR r12, r14
  LDI r8, 0x2002
  STORE r8, r12        ; body[2] = (16,16)

  LDI r12, 2
  LDI r8, 0x2200
  STORE r8, r12        ; head = 2
  LDI r12, 0
  LDI r8, 0x2201
  STORE r8, r12        ; tail = 0
  LDI r12, 3
  LDI r8, 0x2202
  STORE r8, r12        ; length = 3

  LDI r12, 1           ; direction = right
  LDI r8, 0x2205
  STORE r8, r12

  LDI r12, 0           ; game_over = 0
  LDI r8, 0x2206
  STORE r8, r12

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r8, 0x2206
  LOAD r12, r8
  JNZ r12, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r6

  LDI r0, 87          ; W / w = up
  CMP r6, r0
  JZ r7, try_up
  LDI r0, 119
  CMP r6, r0
  JZ r7, try_up

  LDI r0, 68          ; D / d = right
  CMP r6, r0
  JZ r7, try_right
  LDI r0, 100
  CMP r6, r0
  JZ r7, try_right

  LDI r0, 83          ; S / s = down
  CMP r6, r0
  JZ r7, try_down
  LDI r0, 115
  CMP r6, r0
  JZ r7, try_down

  LDI r0, 65          ; A / a = left
  CMP r6, r0
  JZ r7, try_left
  LDI r0, 97
  CMP r6, r0
  JZ r7, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r8, 0xFFE
  LOAD r10, r8           ; r10 = TICKS
  LDI r5, 7
  AND r10, r5            ; r10 = TICKS & 7
  JZ r10, do_move        ; move on frame 0, 8, 16, ...
  CALL draw_frame
  FRAME
  JMP game_loop

do_move:
  CALL move_snake
  CALL draw_frame
  FRAME
  JMP game_loop

try_up:
  LDI r8, 0x2205
  LOAD r0, r8
  LDI r5, 2
  CMP r0, r5
  JZ r7, after_input  ; refuse if going down
  LDI r12, 0
  STORE r8, r12
  JMP after_input

try_right:
  LDI r8, 0x2205
  LOAD r0, r8
  LDI r5, 3
  CMP r0, r5
  JZ r7, after_input  ; refuse if going left
  LDI r12, 1
  STORE r8, r12
  JMP after_input

try_down:
  LDI r8, 0x2205
  LOAD r0, r8
  LDI r5, 0
  CMP r0, r5
  JZ r7, after_input  ; refuse if going up
  LDI r12, 2
  STORE r8, r12
  JMP after_input

try_left:
  LDI r8, 0x2205
  LOAD r0, r8
  LDI r5, 1
  CMP r0, r5
  JZ r7, after_input  ; refuse if going right
  LDI r12, 3
  STORE r8, r12
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r12, 0x550000
  FILL r12
  FRAME
  IKEY r6
  JZ r6, game_over_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: move_snake
;   Reads direction, computes new head, checks walls + apple.
;   PUSH/POP r31 because we may nested-call place_apple.
; ─────────────────────────────────────────────────────────────────
move_snake:
  PUSH r31

  ; load head cell
  LDI r8, 0x2200
  LOAD r4, r8         ; r4 = head index
  LDI r8, 0x2000
  ADD r8, r4
  LOAD r11, r8         ; r11 = head cell = (x<<8)|y

  ; decode head x (r15), y (r3)
  LDI r5, 8
  LDI r15, 0
  ADD r15, r11
  SHR r15, r5          ; r15 = x
  LDI r5, 0xFF
  LDI r3, 0
  ADD r3, r11
  AND r3, r5          ; r3 = y

  ; load direction
  LDI r8, 0x2205
  LOAD r1, r8

  LDI r5, 0
  CMP r1, r5
  JZ r7, dir_up
  LDI r5, 1
  CMP r1, r5
  JZ r7, dir_right
  LDI r5, 2
  CMP r1, r5
  JZ r7, dir_down
  ; left: x -= 1
  LDI r5, 1
  SUB r15, r5
  JMP wall_check

dir_up:
  LDI r5, 1
  SUB r3, r5
  JMP wall_check

dir_right:
  LDI r5, 1
  ADD r15, r5
  JMP wall_check

dir_down:
  LDI r5, 1
  ADD r3, r5

wall_check:
  ; x >= 32 -> hit
  LDI r5, 32
  CMP r15, r5
  BGE r7, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r5, 0
  CMP r15, r5
  BLT r7, do_wall_hit
  ; y < 0
  CMP r3, r5
  BLT r7, do_wall_hit
  ; y >= 32
  LDI r5, 32
  CMP r3, r5
  BGE r7, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r5, 8
  LDI r11, 0
  ADD r11, r15
  SHL r11, r5
  OR r11, r3

  ; advance head index (mod 512)
  LDI r8, 0x2200
  LOAD r4, r8
  LDI r5, 1
  ADD r4, r5
  LDI r5, 0x1FF
  AND r4, r5
  STORE r8, r4

  ; store new head cell
  LDI r8, 0x2000
  ADD r8, r4
  STORE r8, r11

  ; check apple: compare new head_x with apple_x
  LDI r8, 0x2203
  LOAD r20, r8          ; apple_x
  LDI r8, 0x2204
  LOAD r21, r8          ; apple_y
  CMP r15, r20
  JZ r7, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r3, r21
  JZ r7, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r8, 0x2201
  LOAD r22, r8
  LDI r5, 1
  ADD r22, r5
  LDI r5, 0x1FF
  AND r22, r5
  LDI r8, 0x2201
  STORE r8, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r8, 0x2202
  LOAD r5, r8
  LDI r20, 1
  ADD r5, r20
  STORE r8, r5
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r9, 880
  LDI r0, 60
  BEEP r9, r0
  POP r31
  RET

do_wall_hit:
  LDI r12, 1
  LDI r8, 0x2206
  STORE r8, r12
  ; death sound: 110 Hz, 300 ms
  LDI r9, 110
  LDI r0, 300
  BEEP r9, r0
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r12
  LDI r14, 31
  AND r12, r14
  LDI r8, 0x2203
  STORE r8, r12
  RAND r12
  AND r12, r14
  LDI r8, 0x2204
  STORE r8, r12
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r12, 0x001008
  FILL r12

  ; draw apple (red 8x8 block)
  LDI r8, 0x2203
  LOAD r14, r8           ; apple_x
  LDI r8, 0x2204
  LOAD r2, r8           ; apple_y
  LDI r5, 8
  MUL r14, r5            ; px_x
  MUL r2, r5            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r14, r2, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r8, 0x2201
  LOAD r4, r8           ; r4 = tail index
  LDI r8, 0x2202
  LOAD r25, r8           ; r25 = length (loop counter)

draw_loop:
  LDI r8, 0x2000
  ADD r8, r4
  LOAD r12, r8            ; r12 = cell = (x<<8)|y

  ; x = r12 >> 8
  LDI r5, 8
  LDI r14, 0
  ADD r14, r12
  SHR r14, r5             ; r14 = x

  ; y = r12 & 0xFF
  LDI r2, 0xFF
  AND r2, r12             ; r2 = y

  ; pixel coords
  LDI r5, 8
  MUL r14, r5
  MUL r2, r5

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r14, r2, r22, r23, r24

  ; advance ring buffer index
  LDI r5, 1
  ADD r4, r5
  LDI r5, 0x1FF
  AND r4, r5

  ; decrement counter and loop
  LDI r5, 1
  SUB r25, r5
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
