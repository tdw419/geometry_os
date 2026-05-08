; DESCRIPTION: Geometry OS program to draw a colored rectangle.

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
  LDI r3, 0x2000
  LDI r2, 8

  LDI r12, 14
  SHL r12, r2
  LDI r15, 16
  OR r12, r15
  STORE r3, r12        ; body[0] = (14,16)

  LDI r12, 15
  SHL r12, r2
  OR r12, r15
  LDI r3, 0x2001
  STORE r3, r12        ; body[1] = (15,16)

  LDI r12, 16
  SHL r12, r2
  OR r12, r15
  LDI r3, 0x2002
  STORE r3, r12        ; body[2] = (16,16)

  LDI r12, 2
  LDI r3, 0x2200
  STORE r3, r12        ; head = 2
  LDI r12, 0
  LDI r3, 0x2201
  STORE r3, r12        ; tail = 0
  LDI r12, 3
  LDI r3, 0x2202
  STORE r3, r12        ; length = 3

  LDI r12, 1           ; direction = right
  LDI r3, 0x2205
  STORE r3, r12

  LDI r12, 0           ; game_over = 0
  LDI r3, 0x2206
  STORE r3, r12

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r3, 0x2206
  LOAD r12, r3
  JNZ r12, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r14

  LDI r7, 87          ; W / w = up
  CMP r14, r7
  JZ r11, try_up
  LDI r7, 119
  CMP r14, r7
  JZ r11, try_up

  LDI r7, 68          ; D / d = right
  CMP r14, r7
  JZ r11, try_right
  LDI r7, 100
  CMP r14, r7
  JZ r11, try_right

  LDI r7, 83          ; S / s = down
  CMP r14, r7
  JZ r11, try_down
  LDI r7, 115
  CMP r14, r7
  JZ r11, try_down

  LDI r7, 65          ; A / a = left
  CMP r14, r7
  JZ r11, try_left
  LDI r7, 97
  CMP r14, r7
  JZ r11, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r3, 0xFFE
  LOAD r1, r3           ; r1 = TICKS
  LDI r2, 7
  AND r1, r2            ; r1 = TICKS & 7
  JZ r1, do_move        ; move on frame 0, 8, 16, ...
  CALL draw_frame
  FRAME
  JMP game_loop

do_move:
  CALL move_snake
  CALL draw_frame
  FRAME
  JMP game_loop

try_up:
  LDI r3, 0x2205
  LOAD r7, r3
  LDI r2, 2
  CMP r7, r2
  JZ r11, after_input  ; refuse if going down
  LDI r12, 0
  STORE r3, r12
  JMP after_input

try_right:
  LDI r3, 0x2205
  LOAD r7, r3
  LDI r2, 3
  CMP r7, r2
  JZ r11, after_input  ; refuse if going left
  LDI r12, 1
  STORE r3, r12
  JMP after_input

try_down:
  LDI r3, 0x2205
  LOAD r7, r3
  LDI r2, 0
  CMP r7, r2
  JZ r11, after_input  ; refuse if going up
  LDI r12, 2
  STORE r3, r12
  JMP after_input

try_left:
  LDI r3, 0x2205
  LOAD r7, r3
  LDI r2, 1
  CMP r7, r2
  JZ r11, after_input  ; refuse if going right
  LDI r12, 3
  STORE r3, r12
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r12, 0x550000
  FILL r12
  FRAME
  IKEY r14
  JZ r14, game_over_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: move_snake
;   Reads direction, computes new head, checks walls + apple.
;   PUSH/POP r31 because we may nested-call place_apple.
; ─────────────────────────────────────────────────────────────────
move_snake:
  PUSH r31

  ; load head cell
  LDI r3, 0x2200
  LOAD r4, r3         ; r4 = head index
  LDI r3, 0x2000
  ADD r3, r4
  LOAD r13, r3         ; r13 = head cell = (x<<8)|y

  ; decode head x (r8), y (r0)
  LDI r2, 8
  LDI r8, 0
  ADD r8, r13
  SHR r8, r2          ; r8 = x
  LDI r2, 0xFF
  LDI r0, 0
  ADD r0, r13
  AND r0, r2          ; r0 = y

  ; load direction
  LDI r3, 0x2205
  LOAD r6, r3

  LDI r2, 0
  CMP r6, r2
  JZ r11, dir_up
  LDI r2, 1
  CMP r6, r2
  JZ r11, dir_right
  LDI r2, 2
  CMP r6, r2
  JZ r11, dir_down
  ; left: x -= 1
  LDI r2, 1
  SUB r8, r2
  JMP wall_check

dir_up:
  LDI r2, 1
  SUB r0, r2
  JMP wall_check

dir_right:
  LDI r2, 1
  ADD r8, r2
  JMP wall_check

dir_down:
  LDI r2, 1
  ADD r0, r2

wall_check:
  ; x >= 32 -> hit
  LDI r2, 32
  CMP r8, r2
  BGE r11, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r2, 0
  CMP r8, r2
  BLT r11, do_wall_hit
  ; y < 0
  CMP r0, r2
  BLT r11, do_wall_hit
  ; y >= 32
  LDI r2, 32
  CMP r0, r2
  BGE r11, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r2, 8
  LDI r13, 0
  ADD r13, r8
  SHL r13, r2
  OR r13, r0

  ; advance head index (mod 512)
  LDI r3, 0x2200
  LOAD r4, r3
  LDI r2, 1
  ADD r4, r2
  LDI r2, 0x1FF
  AND r4, r2
  STORE r3, r4

  ; store new head cell
  LDI r3, 0x2000
  ADD r3, r4
  STORE r3, r13

  ; check apple: compare new head_x with apple_x
  LDI r3, 0x2203
  LOAD r20, r3          ; apple_x
  LDI r3, 0x2204
  LOAD r21, r3          ; apple_y
  CMP r8, r20
  JZ r11, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r0, r21
  JZ r11, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r3, 0x2201
  LOAD r22, r3
  LDI r2, 1
  ADD r22, r2
  LDI r2, 0x1FF
  AND r22, r2
  LDI r3, 0x2201
  STORE r3, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r3, 0x2202
  LOAD r2, r3
  LDI r20, 1
  ADD r2, r20
  STORE r3, r2
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r10, 880
  LDI r7, 60
  BEEP r10, r7
  POP r31
  RET

do_wall_hit:
  LDI r12, 1
  LDI r3, 0x2206
  STORE r3, r12
  ; death sound: 110 Hz, 300 ms
  LDI r10, 110
  LDI r7, 300
  BEEP r10, r7
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r12
  LDI r15, 31
  AND r12, r15
  LDI r3, 0x2203
  STORE r3, r12
  RAND r12
  AND r12, r15
  LDI r3, 0x2204
  STORE r3, r12
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
  LDI r3, 0x2203
  LOAD r15, r3           ; apple_x
  LDI r3, 0x2204
  LOAD r9, r3           ; apple_y
  LDI r2, 8
  MUL r15, r2            ; px_x
  MUL r9, r2            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r15, r9, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r3, 0x2201
  LOAD r4, r3           ; r4 = tail index
  LDI r3, 0x2202
  LOAD r25, r3           ; r25 = length (loop counter)

draw_loop:
  LDI r3, 0x2000
  ADD r3, r4
  LOAD r12, r3            ; r12 = cell = (x<<8)|y

  ; x = r12 >> 8
  LDI r2, 8
  LDI r15, 0
  ADD r15, r12
  SHR r15, r2             ; r15 = x

  ; y = r12 & 0xFF
  LDI r9, 0xFF
  AND r9, r12             ; r9 = y

  ; pixel coords
  LDI r2, 8
  MUL r15, r2
  MUL r9, r2

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r15, r9, r22, r23, r24

  ; advance ring buffer index
  LDI r2, 1
  ADD r4, r2
  LDI r2, 0x1FF
  AND r4, r2

  ; decrement counter and loop
  LDI r2, 1
  SUB r25, r2
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
