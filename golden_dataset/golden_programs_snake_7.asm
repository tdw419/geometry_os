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
  LDI r11, 0x2000
  LDI r12, 8

  LDI r5, 14
  SHL r5, r12
  LDI r1, 16
  OR r5, r1
  STORE r11, r5        ; body[0] = (14,16)

  LDI r5, 15
  SHL r5, r12
  OR r5, r1
  LDI r11, 0x2001
  STORE r11, r5        ; body[1] = (15,16)

  LDI r5, 16
  SHL r5, r12
  OR r5, r1
  LDI r11, 0x2002
  STORE r11, r5        ; body[2] = (16,16)

  LDI r5, 2
  LDI r11, 0x2200
  STORE r11, r5        ; head = 2
  LDI r5, 0
  LDI r11, 0x2201
  STORE r11, r5        ; tail = 0
  LDI r5, 3
  LDI r11, 0x2202
  STORE r11, r5        ; length = 3

  LDI r5, 1           ; direction = right
  LDI r11, 0x2205
  STORE r11, r5

  LDI r5, 0           ; game_over = 0
  LDI r11, 0x2206
  STORE r11, r5

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r11, 0x2206
  LOAD r5, r11
  JNZ r5, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r2

  LDI r9, 87          ; W / w = up
  CMP r2, r9
  JZ r8, try_up
  LDI r9, 119
  CMP r2, r9
  JZ r8, try_up

  LDI r9, 68          ; D / d = right
  CMP r2, r9
  JZ r8, try_right
  LDI r9, 100
  CMP r2, r9
  JZ r8, try_right

  LDI r9, 83          ; S / s = down
  CMP r2, r9
  JZ r8, try_down
  LDI r9, 115
  CMP r2, r9
  JZ r8, try_down

  LDI r9, 65          ; A / a = left
  CMP r2, r9
  JZ r8, try_left
  LDI r9, 97
  CMP r2, r9
  JZ r8, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r11, 0xFFE
  LOAD r6, r11           ; r6 = TICKS
  LDI r12, 7
  AND r6, r12            ; r6 = TICKS & 7
  JZ r6, do_move        ; move on frame 0, 8, 16, ...
  CALL draw_frame
  FRAME
  JMP game_loop

do_move:
  CALL move_snake
  CALL draw_frame
  FRAME
  JMP game_loop

try_up:
  LDI r11, 0x2205
  LOAD r9, r11
  LDI r12, 2
  CMP r9, r12
  JZ r8, after_input  ; refuse if going down
  LDI r5, 0
  STORE r11, r5
  JMP after_input

try_right:
  LDI r11, 0x2205
  LOAD r9, r11
  LDI r12, 3
  CMP r9, r12
  JZ r8, after_input  ; refuse if going left
  LDI r5, 1
  STORE r11, r5
  JMP after_input

try_down:
  LDI r11, 0x2205
  LOAD r9, r11
  LDI r12, 0
  CMP r9, r12
  JZ r8, after_input  ; refuse if going up
  LDI r5, 2
  STORE r11, r5
  JMP after_input

try_left:
  LDI r11, 0x2205
  LOAD r9, r11
  LDI r12, 1
  CMP r9, r12
  JZ r8, after_input  ; refuse if going right
  LDI r5, 3
  STORE r11, r5
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r5, 0x550000
  FILL r5
  FRAME
  IKEY r2
  JZ r2, game_over_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: move_snake
;   Reads direction, computes new head, checks walls + apple.
;   PUSH/POP r31 because we may nested-call place_apple.
; ─────────────────────────────────────────────────────────────────
move_snake:
  PUSH r31

  ; load head cell
  LDI r11, 0x2200
  LOAD r7, r11         ; r7 = head index
  LDI r11, 0x2000
  ADD r11, r7
  LOAD r3, r11         ; r3 = head cell = (x<<8)|y

  ; decode head x (r13), y (r10)
  LDI r12, 8
  LDI r13, 0
  ADD r13, r3
  SHR r13, r12          ; r13 = x
  LDI r12, 0xFF
  LDI r10, 0
  ADD r10, r3
  AND r10, r12          ; r10 = y

  ; load direction
  LDI r11, 0x2205
  LOAD r15, r11

  LDI r12, 0
  CMP r15, r12
  JZ r8, dir_up
  LDI r12, 1
  CMP r15, r12
  JZ r8, dir_right
  LDI r12, 2
  CMP r15, r12
  JZ r8, dir_down
  ; left: x -= 1
  LDI r12, 1
  SUB r13, r12
  JMP wall_check

dir_up:
  LDI r12, 1
  SUB r10, r12
  JMP wall_check

dir_right:
  LDI r12, 1
  ADD r13, r12
  JMP wall_check

dir_down:
  LDI r12, 1
  ADD r10, r12

wall_check:
  ; x >= 32 -> hit
  LDI r12, 32
  CMP r13, r12
  BGE r8, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r12, 0
  CMP r13, r12
  BLT r8, do_wall_hit
  ; y < 0
  CMP r10, r12
  BLT r8, do_wall_hit
  ; y >= 32
  LDI r12, 32
  CMP r10, r12
  BGE r8, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r12, 8
  LDI r3, 0
  ADD r3, r13
  SHL r3, r12
  OR r3, r10

  ; advance head index (mod 512)
  LDI r11, 0x2200
  LOAD r7, r11
  LDI r12, 1
  ADD r7, r12
  LDI r12, 0x1FF
  AND r7, r12
  STORE r11, r7

  ; store new head cell
  LDI r11, 0x2000
  ADD r11, r7
  STORE r11, r3

  ; check apple: compare new head_x with apple_x
  LDI r11, 0x2203
  LOAD r20, r11          ; apple_x
  LDI r11, 0x2204
  LOAD r21, r11          ; apple_y
  CMP r13, r20
  JZ r8, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r10, r21
  JZ r8, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r11, 0x2201
  LOAD r22, r11
  LDI r12, 1
  ADD r22, r12
  LDI r12, 0x1FF
  AND r22, r12
  LDI r11, 0x2201
  STORE r11, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r11, 0x2202
  LOAD r12, r11
  LDI r20, 1
  ADD r12, r20
  STORE r11, r12
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r0, 880
  LDI r9, 60
  BEEP r0, r9
  POP r31
  RET

do_wall_hit:
  LDI r5, 1
  LDI r11, 0x2206
  STORE r11, r5
  ; death sound: 110 Hz, 300 ms
  LDI r0, 110
  LDI r9, 300
  BEEP r0, r9
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r5
  LDI r1, 31
  AND r5, r1
  LDI r11, 0x2203
  STORE r11, r5
  RAND r5
  AND r5, r1
  LDI r11, 0x2204
  STORE r11, r5
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r5, 0x001008
  FILL r5

  ; draw apple (red 8x8 block)
  LDI r11, 0x2203
  LOAD r1, r11           ; apple_x
  LDI r11, 0x2204
  LOAD r4, r11           ; apple_y
  LDI r12, 8
  MUL r1, r12            ; px_x
  MUL r4, r12            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r1, r4, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r11, 0x2201
  LOAD r7, r11           ; r7 = tail index
  LDI r11, 0x2202
  LOAD r25, r11           ; r25 = length (loop counter)

draw_loop:
  LDI r11, 0x2000
  ADD r11, r7
  LOAD r5, r11            ; r5 = cell = (x<<8)|y

  ; x = r5 >> 8
  LDI r12, 8
  LDI r1, 0
  ADD r1, r5
  SHR r1, r12             ; r1 = x

  ; y = r5 & 0xFF
  LDI r4, 0xFF
  AND r4, r5             ; r4 = y

  ; pixel coords
  LDI r12, 8
  MUL r1, r12
  MUL r4, r12

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r1, r4, r22, r23, r24

  ; advance ring buffer index
  LDI r12, 1
  ADD r7, r12
  LDI r12, 0x1FF
  AND r7, r12

  ; decrement counter and loop
  LDI r12, 1
  SUB r25, r12
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
