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
  LDI r13, 0x2000
  LDI r0, 8

  LDI r5, 14
  SHL r5, r0
  LDI r15, 16
  OR r5, r15
  STORE r13, r5        ; body[0] = (14,16)

  LDI r5, 15
  SHL r5, r0
  OR r5, r15
  LDI r13, 0x2001
  STORE r13, r5        ; body[1] = (15,16)

  LDI r5, 16
  SHL r5, r0
  OR r5, r15
  LDI r13, 0x2002
  STORE r13, r5        ; body[2] = (16,16)

  LDI r5, 2
  LDI r13, 0x2200
  STORE r13, r5        ; head = 2
  LDI r5, 0
  LDI r13, 0x2201
  STORE r13, r5        ; tail = 0
  LDI r5, 3
  LDI r13, 0x2202
  STORE r13, r5        ; length = 3

  LDI r5, 1           ; direction = right
  LDI r13, 0x2205
  STORE r13, r5

  LDI r5, 0           ; game_over = 0
  LDI r13, 0x2206
  STORE r13, r5

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r13, 0x2206
  LOAD r5, r13
  JNZ r5, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r12

  LDI r8, 87          ; W / w = up
  CMP r12, r8
  JZ r4, try_up
  LDI r8, 119
  CMP r12, r8
  JZ r4, try_up

  LDI r8, 68          ; D / d = right
  CMP r12, r8
  JZ r4, try_right
  LDI r8, 100
  CMP r12, r8
  JZ r4, try_right

  LDI r8, 83          ; S / s = down
  CMP r12, r8
  JZ r4, try_down
  LDI r8, 115
  CMP r12, r8
  JZ r4, try_down

  LDI r8, 65          ; A / a = left
  CMP r12, r8
  JZ r4, try_left
  LDI r8, 97
  CMP r12, r8
  JZ r4, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r13, 0xFFE
  LOAD r1, r13           ; r1 = TICKS
  LDI r0, 7
  AND r1, r0            ; r1 = TICKS & 7
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
  LDI r13, 0x2205
  LOAD r8, r13
  LDI r0, 2
  CMP r8, r0
  JZ r4, after_input  ; refuse if going down
  LDI r5, 0
  STORE r13, r5
  JMP after_input

try_right:
  LDI r13, 0x2205
  LOAD r8, r13
  LDI r0, 3
  CMP r8, r0
  JZ r4, after_input  ; refuse if going left
  LDI r5, 1
  STORE r13, r5
  JMP after_input

try_down:
  LDI r13, 0x2205
  LOAD r8, r13
  LDI r0, 0
  CMP r8, r0
  JZ r4, after_input  ; refuse if going up
  LDI r5, 2
  STORE r13, r5
  JMP after_input

try_left:
  LDI r13, 0x2205
  LOAD r8, r13
  LDI r0, 1
  CMP r8, r0
  JZ r4, after_input  ; refuse if going right
  LDI r5, 3
  STORE r13, r5
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r5, 0x550000
  FILL r5
  FRAME
  IKEY r12
  JZ r12, game_over_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: move_snake
;   Reads direction, computes new head, checks walls + apple.
;   PUSH/POP r31 because we may nested-call place_apple.
; ─────────────────────────────────────────────────────────────────
move_snake:
  PUSH r31

  ; load head cell
  LDI r13, 0x2200
  LOAD r11, r13         ; r11 = head index
  LDI r13, 0x2000
  ADD r13, r11
  LOAD r7, r13         ; r7 = head cell = (x<<8)|y

  ; decode head x (r10), y (r2)
  LDI r0, 8
  LDI r10, 0
  ADD r10, r7
  SHR r10, r0          ; r10 = x
  LDI r0, 0xFF
  LDI r2, 0
  ADD r2, r7
  AND r2, r0          ; r2 = y

  ; load direction
  LDI r13, 0x2205
  LOAD r9, r13

  LDI r0, 0
  CMP r9, r0
  JZ r4, dir_up
  LDI r0, 1
  CMP r9, r0
  JZ r4, dir_right
  LDI r0, 2
  CMP r9, r0
  JZ r4, dir_down
  ; left: x -= 1
  LDI r0, 1
  SUB r10, r0
  JMP wall_check

dir_up:
  LDI r0, 1
  SUB r2, r0
  JMP wall_check

dir_right:
  LDI r0, 1
  ADD r10, r0
  JMP wall_check

dir_down:
  LDI r0, 1
  ADD r2, r0

wall_check:
  ; x >= 32 -> hit
  LDI r0, 32
  CMP r10, r0
  BGE r4, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r0, 0
  CMP r10, r0
  BLT r4, do_wall_hit
  ; y < 0
  CMP r2, r0
  BLT r4, do_wall_hit
  ; y >= 32
  LDI r0, 32
  CMP r2, r0
  BGE r4, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r0, 8
  LDI r7, 0
  ADD r7, r10
  SHL r7, r0
  OR r7, r2

  ; advance head index (mod 512)
  LDI r13, 0x2200
  LOAD r11, r13
  LDI r0, 1
  ADD r11, r0
  LDI r0, 0x1FF
  AND r11, r0
  STORE r13, r11

  ; store new head cell
  LDI r13, 0x2000
  ADD r13, r11
  STORE r13, r7

  ; check apple: compare new head_x with apple_x
  LDI r13, 0x2203
  LOAD r20, r13          ; apple_x
  LDI r13, 0x2204
  LOAD r21, r13          ; apple_y
  CMP r10, r20
  JZ r4, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r2, r21
  JZ r4, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r13, 0x2201
  LOAD r22, r13
  LDI r0, 1
  ADD r22, r0
  LDI r0, 0x1FF
  AND r22, r0
  LDI r13, 0x2201
  STORE r13, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r13, 0x2202
  LOAD r0, r13
  LDI r20, 1
  ADD r0, r20
  STORE r13, r0
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r6, 880
  LDI r8, 60
  BEEP r6, r8
  POP r31
  RET

do_wall_hit:
  LDI r5, 1
  LDI r13, 0x2206
  STORE r13, r5
  ; death sound: 110 Hz, 300 ms
  LDI r6, 110
  LDI r8, 300
  BEEP r6, r8
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r5
  LDI r15, 31
  AND r5, r15
  LDI r13, 0x2203
  STORE r13, r5
  RAND r5
  AND r5, r15
  LDI r13, 0x2204
  STORE r13, r5
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
  LDI r13, 0x2203
  LOAD r15, r13           ; apple_x
  LDI r13, 0x2204
  LOAD r14, r13           ; apple_y
  LDI r0, 8
  MUL r15, r0            ; px_x
  MUL r14, r0            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r15, r14, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r13, 0x2201
  LOAD r11, r13           ; r11 = tail index
  LDI r13, 0x2202
  LOAD r25, r13           ; r25 = length (loop counter)

draw_loop:
  LDI r13, 0x2000
  ADD r13, r11
  LOAD r5, r13            ; r5 = cell = (x<<8)|y

  ; x = r5 >> 8
  LDI r0, 8
  LDI r15, 0
  ADD r15, r5
  SHR r15, r0             ; r15 = x

  ; y = r5 & 0xFF
  LDI r14, 0xFF
  AND r14, r5             ; r14 = y

  ; pixel coords
  LDI r0, 8
  MUL r15, r0
  MUL r14, r0

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r15, r14, r22, r23, r24

  ; advance ring buffer index
  LDI r0, 1
  ADD r11, r0
  LDI r0, 0x1FF
  AND r11, r0

  ; decrement counter and loop
  LDI r0, 1
  SUB r25, r0
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
