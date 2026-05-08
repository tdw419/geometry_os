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
  LDI r2, 0x2000
  LDI r11, 8

  LDI r15, 14
  SHL r15, r11
  LDI r9, 16
  OR r15, r9
  STORE r2, r15        ; body[0] = (14,16)

  LDI r15, 15
  SHL r15, r11
  OR r15, r9
  LDI r2, 0x2001
  STORE r2, r15        ; body[1] = (15,16)

  LDI r15, 16
  SHL r15, r11
  OR r15, r9
  LDI r2, 0x2002
  STORE r2, r15        ; body[2] = (16,16)

  LDI r15, 2
  LDI r2, 0x2200
  STORE r2, r15        ; head = 2
  LDI r15, 0
  LDI r2, 0x2201
  STORE r2, r15        ; tail = 0
  LDI r15, 3
  LDI r2, 0x2202
  STORE r2, r15        ; length = 3

  LDI r15, 1           ; direction = right
  LDI r2, 0x2205
  STORE r2, r15

  LDI r15, 0           ; game_over = 0
  LDI r2, 0x2206
  STORE r2, r15

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r2, 0x2206
  LOAD r15, r2
  JNZ r15, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r5

  LDI r14, 87          ; W / w = up
  CMP r5, r14
  JZ r6, try_up
  LDI r14, 119
  CMP r5, r14
  JZ r6, try_up

  LDI r14, 68          ; D / d = right
  CMP r5, r14
  JZ r6, try_right
  LDI r14, 100
  CMP r5, r14
  JZ r6, try_right

  LDI r14, 83          ; S / s = down
  CMP r5, r14
  JZ r6, try_down
  LDI r14, 115
  CMP r5, r14
  JZ r6, try_down

  LDI r14, 65          ; A / a = left
  CMP r5, r14
  JZ r6, try_left
  LDI r14, 97
  CMP r5, r14
  JZ r6, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r2, 0xFFE
  LOAD r7, r2           ; r7 = TICKS
  LDI r11, 7
  AND r7, r11            ; r7 = TICKS & 7
  JZ r7, do_move        ; move on frame 0, 8, 16, ...
  CALL draw_frame
  FRAME
  JMP game_loop

do_move:
  CALL move_snake
  CALL draw_frame
  FRAME
  JMP game_loop

try_up:
  LDI r2, 0x2205
  LOAD r14, r2
  LDI r11, 2
  CMP r14, r11
  JZ r6, after_input  ; refuse if going down
  LDI r15, 0
  STORE r2, r15
  JMP after_input

try_right:
  LDI r2, 0x2205
  LOAD r14, r2
  LDI r11, 3
  CMP r14, r11
  JZ r6, after_input  ; refuse if going left
  LDI r15, 1
  STORE r2, r15
  JMP after_input

try_down:
  LDI r2, 0x2205
  LOAD r14, r2
  LDI r11, 0
  CMP r14, r11
  JZ r6, after_input  ; refuse if going up
  LDI r15, 2
  STORE r2, r15
  JMP after_input

try_left:
  LDI r2, 0x2205
  LOAD r14, r2
  LDI r11, 1
  CMP r14, r11
  JZ r6, after_input  ; refuse if going right
  LDI r15, 3
  STORE r2, r15
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r15, 0x550000
  FILL r15
  FRAME
  IKEY r5
  JZ r5, game_over_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: move_snake
;   Reads direction, computes new head, checks walls + apple.
;   PUSH/POP r31 because we may nested-call place_apple.
; ─────────────────────────────────────────────────────────────────
move_snake:
  PUSH r31

  ; load head cell
  LDI r2, 0x2200
  LOAD r4, r2         ; r4 = head index
  LDI r2, 0x2000
  ADD r2, r4
  LOAD r10, r2         ; r10 = head cell = (x<<8)|y

  ; decode head x (r13), y (r1)
  LDI r11, 8
  LDI r13, 0
  ADD r13, r10
  SHR r13, r11          ; r13 = x
  LDI r11, 0xFF
  LDI r1, 0
  ADD r1, r10
  AND r1, r11          ; r1 = y

  ; load direction
  LDI r2, 0x2205
  LOAD r8, r2

  LDI r11, 0
  CMP r8, r11
  JZ r6, dir_up
  LDI r11, 1
  CMP r8, r11
  JZ r6, dir_right
  LDI r11, 2
  CMP r8, r11
  JZ r6, dir_down
  ; left: x -= 1
  LDI r11, 1
  SUB r13, r11
  JMP wall_check

dir_up:
  LDI r11, 1
  SUB r1, r11
  JMP wall_check

dir_right:
  LDI r11, 1
  ADD r13, r11
  JMP wall_check

dir_down:
  LDI r11, 1
  ADD r1, r11

wall_check:
  ; x >= 32 -> hit
  LDI r11, 32
  CMP r13, r11
  BGE r6, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r11, 0
  CMP r13, r11
  BLT r6, do_wall_hit
  ; y < 0
  CMP r1, r11
  BLT r6, do_wall_hit
  ; y >= 32
  LDI r11, 32
  CMP r1, r11
  BGE r6, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r11, 8
  LDI r10, 0
  ADD r10, r13
  SHL r10, r11
  OR r10, r1

  ; advance head index (mod 512)
  LDI r2, 0x2200
  LOAD r4, r2
  LDI r11, 1
  ADD r4, r11
  LDI r11, 0x1FF
  AND r4, r11
  STORE r2, r4

  ; store new head cell
  LDI r2, 0x2000
  ADD r2, r4
  STORE r2, r10

  ; check apple: compare new head_x with apple_x
  LDI r2, 0x2203
  LOAD r20, r2          ; apple_x
  LDI r2, 0x2204
  LOAD r21, r2          ; apple_y
  CMP r13, r20
  JZ r6, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r1, r21
  JZ r6, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r2, 0x2201
  LOAD r22, r2
  LDI r11, 1
  ADD r22, r11
  LDI r11, 0x1FF
  AND r22, r11
  LDI r2, 0x2201
  STORE r2, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r2, 0x2202
  LOAD r11, r2
  LDI r20, 1
  ADD r11, r20
  STORE r2, r11
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r3, 880
  LDI r14, 60
  BEEP r3, r14
  POP r31
  RET

do_wall_hit:
  LDI r15, 1
  LDI r2, 0x2206
  STORE r2, r15
  ; death sound: 110 Hz, 300 ms
  LDI r3, 110
  LDI r14, 300
  BEEP r3, r14
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r15
  LDI r9, 31
  AND r15, r9
  LDI r2, 0x2203
  STORE r2, r15
  RAND r15
  AND r15, r9
  LDI r2, 0x2204
  STORE r2, r15
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r15, 0x001008
  FILL r15

  ; draw apple (red 8x8 block)
  LDI r2, 0x2203
  LOAD r9, r2           ; apple_x
  LDI r2, 0x2204
  LOAD r0, r2           ; apple_y
  LDI r11, 8
  MUL r9, r11            ; px_x
  MUL r0, r11            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r9, r0, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r2, 0x2201
  LOAD r4, r2           ; r4 = tail index
  LDI r2, 0x2202
  LOAD r25, r2           ; r25 = length (loop counter)

draw_loop:
  LDI r2, 0x2000
  ADD r2, r4
  LOAD r15, r2            ; r15 = cell = (x<<8)|y

  ; x = r15 >> 8
  LDI r11, 8
  LDI r9, 0
  ADD r9, r15
  SHR r9, r11             ; r9 = x

  ; y = r15 & 0xFF
  LDI r0, 0xFF
  AND r0, r15             ; r0 = y

  ; pixel coords
  LDI r11, 8
  MUL r9, r11
  MUL r0, r11

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r9, r0, r22, r23, r24

  ; advance ring buffer index
  LDI r11, 1
  ADD r4, r11
  LDI r11, 0x1FF
  AND r4, r11

  ; decrement counter and loop
  LDI r11, 1
  SUB r25, r11
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
