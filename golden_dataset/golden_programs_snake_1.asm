; DESCRIPTION: This GeOS assembly code implements a simple snake game on a 32x32 cell grid. The game initializes the snake's position and direction, handles user input to change direction, moves the snake while checking for collisions with walls or apples, and draws the game state including the snake and apple on each frame.

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
  LDI r10, 0x2000
  LDI r13, 8

  LDI r2, 14
  SHL r2, r13
  LDI r11, 16
  OR r2, r11
  STORE r10, r2        ; body[0] = (14,16)

  LDI r2, 15
  SHL r2, r13
  OR r2, r11
  LDI r10, 0x2001
  STORE r10, r2        ; body[1] = (15,16)

  LDI r2, 16
  SHL r2, r13
  OR r2, r11
  LDI r10, 0x2002
  STORE r10, r2        ; body[2] = (16,16)

  LDI r2, 2
  LDI r10, 0x2200
  STORE r10, r2        ; head = 2
  LDI r2, 0
  LDI r10, 0x2201
  STORE r10, r2        ; tail = 0
  LDI r2, 3
  LDI r10, 0x2202
  STORE r10, r2        ; length = 3

  LDI r2, 1           ; direction = right
  LDI r10, 0x2205
  STORE r10, r2

  LDI r2, 0           ; game_over = 0
  LDI r10, 0x2206
  STORE r10, r2

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r10, 0x2206
  LOAD r2, r10
  JNZ r2, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r6

  LDI r14, 87          ; W / w = up
  CMP r6, r14
  JZ r3, try_up
  LDI r14, 119
  CMP r6, r14
  JZ r3, try_up

  LDI r14, 68          ; D / d = right
  CMP r6, r14
  JZ r3, try_right
  LDI r14, 100
  CMP r6, r14
  JZ r3, try_right

  LDI r14, 83          ; S / s = down
  CMP r6, r14
  JZ r3, try_down
  LDI r14, 115
  CMP r6, r14
  JZ r3, try_down

  LDI r14, 65          ; A / a = left
  CMP r6, r14
  JZ r3, try_left
  LDI r14, 97
  CMP r6, r14
  JZ r3, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r10, 0xFFE
  LOAD r15, r10           ; r15 = TICKS
  LDI r13, 7
  AND r15, r13            ; r15 = TICKS & 7
  JZ r15, do_move        ; move on frame 0, 8, 16, ...
  CALL draw_frame
  FRAME
  JMP game_loop

do_move:
  CALL move_snake
  CALL draw_frame
  FRAME
  JMP game_loop

try_up:
  LDI r10, 0x2205
  LOAD r14, r10
  LDI r13, 2
  CMP r14, r13
  JZ r3, after_input  ; refuse if going down
  LDI r2, 0
  STORE r10, r2
  JMP after_input

try_right:
  LDI r10, 0x2205
  LOAD r14, r10
  LDI r13, 3
  CMP r14, r13
  JZ r3, after_input  ; refuse if going left
  LDI r2, 1
  STORE r10, r2
  JMP after_input

try_down:
  LDI r10, 0x2205
  LOAD r14, r10
  LDI r13, 0
  CMP r14, r13
  JZ r3, after_input  ; refuse if going up
  LDI r2, 2
  STORE r10, r2
  JMP after_input

try_left:
  LDI r10, 0x2205
  LOAD r14, r10
  LDI r13, 1
  CMP r14, r13
  JZ r3, after_input  ; refuse if going right
  LDI r2, 3
  STORE r10, r2
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r2, 0x550000
  FILL r2
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
  LDI r10, 0x2200
  LOAD r12, r10         ; r12 = head index
  LDI r10, 0x2000
  ADD r10, r12
  LOAD r7, r10         ; r7 = head cell = (x<<8)|y

  ; decode head x (r0), y (r9)
  LDI r13, 8
  LDI r0, 0
  ADD r0, r7
  SHR r0, r13          ; r0 = x
  LDI r13, 0xFF
  LDI r9, 0
  ADD r9, r7
  AND r9, r13          ; r9 = y

  ; load direction
  LDI r10, 0x2205
  LOAD r4, r10

  LDI r13, 0
  CMP r4, r13
  JZ r3, dir_up
  LDI r13, 1
  CMP r4, r13
  JZ r3, dir_right
  LDI r13, 2
  CMP r4, r13
  JZ r3, dir_down
  ; left: x -= 1
  LDI r13, 1
  SUB r0, r13
  JMP wall_check

dir_up:
  LDI r13, 1
  SUB r9, r13
  JMP wall_check

dir_right:
  LDI r13, 1
  ADD r0, r13
  JMP wall_check

dir_down:
  LDI r13, 1
  ADD r9, r13

wall_check:
  ; x >= 32 -> hit
  LDI r13, 32
  CMP r0, r13
  BGE r3, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r13, 0
  CMP r0, r13
  BLT r3, do_wall_hit
  ; y < 0
  CMP r9, r13
  BLT r3, do_wall_hit
  ; y >= 32
  LDI r13, 32
  CMP r9, r13
  BGE r3, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r13, 8
  LDI r7, 0
  ADD r7, r0
  SHL r7, r13
  OR r7, r9

  ; advance head index (mod 512)
  LDI r10, 0x2200
  LOAD r12, r10
  LDI r13, 1
  ADD r12, r13
  LDI r13, 0x1FF
  AND r12, r13
  STORE r10, r12

  ; store new head cell
  LDI r10, 0x2000
  ADD r10, r12
  STORE r10, r7

  ; check apple: compare new head_x with apple_x
  LDI r10, 0x2203
  LOAD r20, r10          ; apple_x
  LDI r10, 0x2204
  LOAD r21, r10          ; apple_y
  CMP r0, r20
  JZ r3, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r9, r21
  JZ r3, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r10, 0x2201
  LOAD r22, r10
  LDI r13, 1
  ADD r22, r13
  LDI r13, 0x1FF
  AND r22, r13
  LDI r10, 0x2201
  STORE r10, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r10, 0x2202
  LOAD r13, r10
  LDI r20, 1
  ADD r13, r20
  STORE r10, r13
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r1, 880
  LDI r14, 60
  BEEP r1, r14
  POP r31
  RET

do_wall_hit:
  LDI r2, 1
  LDI r10, 0x2206
  STORE r10, r2
  ; death sound: 110 Hz, 300 ms
  LDI r1, 110
  LDI r14, 300
  BEEP r1, r14
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r2
  LDI r11, 31
  AND r2, r11
  LDI r10, 0x2203
  STORE r10, r2
  RAND r2
  AND r2, r11
  LDI r10, 0x2204
  STORE r10, r2
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r2, 0x001008
  FILL r2

  ; draw apple (red 8x8 block)
  LDI r10, 0x2203
  LOAD r11, r10           ; apple_x
  LDI r10, 0x2204
  LOAD r5, r10           ; apple_y
  LDI r13, 8
  MUL r11, r13            ; px_x
  MUL r5, r13            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r11, r5, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r10, 0x2201
  LOAD r12, r10           ; r12 = tail index
  LDI r10, 0x2202
  LOAD r25, r10           ; r25 = length (loop counter)

draw_loop:
  LDI r10, 0x2000
  ADD r10, r12
  LOAD r2, r10            ; r2 = cell = (x<<8)|y

  ; x = r2 >> 8
  LDI r13, 8
  LDI r11, 0
  ADD r11, r2
  SHR r11, r13             ; r11 = x

  ; y = r2 & 0xFF
  LDI r5, 0xFF
  AND r5, r2             ; r5 = y

  ; pixel coords
  LDI r13, 8
  MUL r11, r13
  MUL r5, r13

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r11, r5, r22, r23, r24

  ; advance ring buffer index
  LDI r13, 1
  ADD r12, r13
  LDI r13, 0x1FF
  AND r12, r13

  ; decrement counter and loop
  LDI r13, 1
  SUB r25, r13
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
