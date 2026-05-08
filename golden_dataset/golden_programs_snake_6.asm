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
  LDI r6, 0x2000
  LDI r15, 8

  LDI r14, 14
  SHL r14, r15
  LDI r2, 16
  OR r14, r2
  STORE r6, r14        ; body[0] = (14,16)

  LDI r14, 15
  SHL r14, r15
  OR r14, r2
  LDI r6, 0x2001
  STORE r6, r14        ; body[1] = (15,16)

  LDI r14, 16
  SHL r14, r15
  OR r14, r2
  LDI r6, 0x2002
  STORE r6, r14        ; body[2] = (16,16)

  LDI r14, 2
  LDI r6, 0x2200
  STORE r6, r14        ; head = 2
  LDI r14, 0
  LDI r6, 0x2201
  STORE r6, r14        ; tail = 0
  LDI r14, 3
  LDI r6, 0x2202
  STORE r6, r14        ; length = 3

  LDI r14, 1           ; direction = right
  LDI r6, 0x2205
  STORE r6, r14

  LDI r14, 0           ; game_over = 0
  LDI r6, 0x2206
  STORE r6, r14

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r6, 0x2206
  LOAD r14, r6
  JNZ r14, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r5

  LDI r7, 87          ; W / w = up
  CMP r5, r7
  JZ r11, try_up
  LDI r7, 119
  CMP r5, r7
  JZ r11, try_up

  LDI r7, 68          ; D / d = right
  CMP r5, r7
  JZ r11, try_right
  LDI r7, 100
  CMP r5, r7
  JZ r11, try_right

  LDI r7, 83          ; S / s = down
  CMP r5, r7
  JZ r11, try_down
  LDI r7, 115
  CMP r5, r7
  JZ r11, try_down

  LDI r7, 65          ; A / a = left
  CMP r5, r7
  JZ r11, try_left
  LDI r7, 97
  CMP r5, r7
  JZ r11, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r6, 0xFFE
  LOAD r8, r6           ; r8 = TICKS
  LDI r15, 7
  AND r8, r15            ; r8 = TICKS & 7
  JZ r8, do_move        ; move on frame 0, 8, 16, ...
  CALL draw_frame
  FRAME
  JMP game_loop

do_move:
  CALL move_snake
  CALL draw_frame
  FRAME
  JMP game_loop

try_up:
  LDI r6, 0x2205
  LOAD r7, r6
  LDI r15, 2
  CMP r7, r15
  JZ r11, after_input  ; refuse if going down
  LDI r14, 0
  STORE r6, r14
  JMP after_input

try_right:
  LDI r6, 0x2205
  LOAD r7, r6
  LDI r15, 3
  CMP r7, r15
  JZ r11, after_input  ; refuse if going left
  LDI r14, 1
  STORE r6, r14
  JMP after_input

try_down:
  LDI r6, 0x2205
  LOAD r7, r6
  LDI r15, 0
  CMP r7, r15
  JZ r11, after_input  ; refuse if going up
  LDI r14, 2
  STORE r6, r14
  JMP after_input

try_left:
  LDI r6, 0x2205
  LOAD r7, r6
  LDI r15, 1
  CMP r7, r15
  JZ r11, after_input  ; refuse if going right
  LDI r14, 3
  STORE r6, r14
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r14, 0x550000
  FILL r14
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
  LDI r6, 0x2200
  LOAD r13, r6         ; r13 = head index
  LDI r6, 0x2000
  ADD r6, r13
  LOAD r1, r6         ; r1 = head cell = (x<<8)|y

  ; decode head x (r9), y (r12)
  LDI r15, 8
  LDI r9, 0
  ADD r9, r1
  SHR r9, r15          ; r9 = x
  LDI r15, 0xFF
  LDI r12, 0
  ADD r12, r1
  AND r12, r15          ; r12 = y

  ; load direction
  LDI r6, 0x2205
  LOAD r0, r6

  LDI r15, 0
  CMP r0, r15
  JZ r11, dir_up
  LDI r15, 1
  CMP r0, r15
  JZ r11, dir_right
  LDI r15, 2
  CMP r0, r15
  JZ r11, dir_down
  ; left: x -= 1
  LDI r15, 1
  SUB r9, r15
  JMP wall_check

dir_up:
  LDI r15, 1
  SUB r12, r15
  JMP wall_check

dir_right:
  LDI r15, 1
  ADD r9, r15
  JMP wall_check

dir_down:
  LDI r15, 1
  ADD r12, r15

wall_check:
  ; x >= 32 -> hit
  LDI r15, 32
  CMP r9, r15
  BGE r11, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r15, 0
  CMP r9, r15
  BLT r11, do_wall_hit
  ; y < 0
  CMP r12, r15
  BLT r11, do_wall_hit
  ; y >= 32
  LDI r15, 32
  CMP r12, r15
  BGE r11, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r15, 8
  LDI r1, 0
  ADD r1, r9
  SHL r1, r15
  OR r1, r12

  ; advance head index (mod 512)
  LDI r6, 0x2200
  LOAD r13, r6
  LDI r15, 1
  ADD r13, r15
  LDI r15, 0x1FF
  AND r13, r15
  STORE r6, r13

  ; store new head cell
  LDI r6, 0x2000
  ADD r6, r13
  STORE r6, r1

  ; check apple: compare new head_x with apple_x
  LDI r6, 0x2203
  LOAD r20, r6          ; apple_x
  LDI r6, 0x2204
  LOAD r21, r6          ; apple_y
  CMP r9, r20
  JZ r11, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r12, r21
  JZ r11, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r6, 0x2201
  LOAD r22, r6
  LDI r15, 1
  ADD r22, r15
  LDI r15, 0x1FF
  AND r22, r15
  LDI r6, 0x2201
  STORE r6, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r6, 0x2202
  LOAD r15, r6
  LDI r20, 1
  ADD r15, r20
  STORE r6, r15
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r3, 880
  LDI r7, 60
  BEEP r3, r7
  POP r31
  RET

do_wall_hit:
  LDI r14, 1
  LDI r6, 0x2206
  STORE r6, r14
  ; death sound: 110 Hz, 300 ms
  LDI r3, 110
  LDI r7, 300
  BEEP r3, r7
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r14
  LDI r2, 31
  AND r14, r2
  LDI r6, 0x2203
  STORE r6, r14
  RAND r14
  AND r14, r2
  LDI r6, 0x2204
  STORE r6, r14
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r14, 0x001008
  FILL r14

  ; draw apple (red 8x8 block)
  LDI r6, 0x2203
  LOAD r2, r6           ; apple_x
  LDI r6, 0x2204
  LOAD r10, r6           ; apple_y
  LDI r15, 8
  MUL r2, r15            ; px_x
  MUL r10, r15            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r2, r10, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r6, 0x2201
  LOAD r13, r6           ; r13 = tail index
  LDI r6, 0x2202
  LOAD r25, r6           ; r25 = length (loop counter)

draw_loop:
  LDI r6, 0x2000
  ADD r6, r13
  LOAD r14, r6            ; r14 = cell = (x<<8)|y

  ; x = r14 >> 8
  LDI r15, 8
  LDI r2, 0
  ADD r2, r14
  SHR r2, r15             ; r2 = x

  ; y = r14 & 0xFF
  LDI r10, 0xFF
  AND r10, r14             ; r10 = y

  ; pixel coords
  LDI r15, 8
  MUL r2, r15
  MUL r10, r15

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r2, r10, r22, r23, r24

  ; advance ring buffer index
  LDI r15, 1
  ADD r13, r15
  LDI r15, 0x1FF
  AND r13, r15

  ; decrement counter and loop
  LDI r15, 1
  SUB r25, r15
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
