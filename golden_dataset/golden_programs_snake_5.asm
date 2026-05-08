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
  LDI r14, 0x2000
  LDI r8, 8

  LDI r13, 14
  SHL r13, r8
  LDI r5, 16
  OR r13, r5
  STORE r14, r13        ; body[0] = (14,16)

  LDI r13, 15
  SHL r13, r8
  OR r13, r5
  LDI r14, 0x2001
  STORE r14, r13        ; body[1] = (15,16)

  LDI r13, 16
  SHL r13, r8
  OR r13, r5
  LDI r14, 0x2002
  STORE r14, r13        ; body[2] = (16,16)

  LDI r13, 2
  LDI r14, 0x2200
  STORE r14, r13        ; head = 2
  LDI r13, 0
  LDI r14, 0x2201
  STORE r14, r13        ; tail = 0
  LDI r13, 3
  LDI r14, 0x2202
  STORE r14, r13        ; length = 3

  LDI r13, 1           ; direction = right
  LDI r14, 0x2205
  STORE r14, r13

  LDI r13, 0           ; game_over = 0
  LDI r14, 0x2206
  STORE r14, r13

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r14, 0x2206
  LOAD r13, r14
  JNZ r13, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r7

  LDI r2, 87          ; W / w = up
  CMP r7, r2
  JZ r15, try_up
  LDI r2, 119
  CMP r7, r2
  JZ r15, try_up

  LDI r2, 68          ; D / d = right
  CMP r7, r2
  JZ r15, try_right
  LDI r2, 100
  CMP r7, r2
  JZ r15, try_right

  LDI r2, 83          ; S / s = down
  CMP r7, r2
  JZ r15, try_down
  LDI r2, 115
  CMP r7, r2
  JZ r15, try_down

  LDI r2, 65          ; A / a = left
  CMP r7, r2
  JZ r15, try_left
  LDI r2, 97
  CMP r7, r2
  JZ r15, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r14, 0xFFE
  LOAD r1, r14           ; r1 = TICKS
  LDI r8, 7
  AND r1, r8            ; r1 = TICKS & 7
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
  LDI r14, 0x2205
  LOAD r2, r14
  LDI r8, 2
  CMP r2, r8
  JZ r15, after_input  ; refuse if going down
  LDI r13, 0
  STORE r14, r13
  JMP after_input

try_right:
  LDI r14, 0x2205
  LOAD r2, r14
  LDI r8, 3
  CMP r2, r8
  JZ r15, after_input  ; refuse if going left
  LDI r13, 1
  STORE r14, r13
  JMP after_input

try_down:
  LDI r14, 0x2205
  LOAD r2, r14
  LDI r8, 0
  CMP r2, r8
  JZ r15, after_input  ; refuse if going up
  LDI r13, 2
  STORE r14, r13
  JMP after_input

try_left:
  LDI r14, 0x2205
  LOAD r2, r14
  LDI r8, 1
  CMP r2, r8
  JZ r15, after_input  ; refuse if going right
  LDI r13, 3
  STORE r14, r13
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r13, 0x550000
  FILL r13
  FRAME
  IKEY r7
  JZ r7, game_over_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: move_snake
;   Reads direction, computes new head, checks walls + apple.
;   PUSH/POP r31 because we may nested-call place_apple.
; ─────────────────────────────────────────────────────────────────
move_snake:
  PUSH r31

  ; load head cell
  LDI r14, 0x2200
  LOAD r6, r14         ; r6 = head index
  LDI r14, 0x2000
  ADD r14, r6
  LOAD r9, r14         ; r9 = head cell = (x<<8)|y

  ; decode head x (r0), y (r4)
  LDI r8, 8
  LDI r0, 0
  ADD r0, r9
  SHR r0, r8          ; r0 = x
  LDI r8, 0xFF
  LDI r4, 0
  ADD r4, r9
  AND r4, r8          ; r4 = y

  ; load direction
  LDI r14, 0x2205
  LOAD r11, r14

  LDI r8, 0
  CMP r11, r8
  JZ r15, dir_up
  LDI r8, 1
  CMP r11, r8
  JZ r15, dir_right
  LDI r8, 2
  CMP r11, r8
  JZ r15, dir_down
  ; left: x -= 1
  LDI r8, 1
  SUB r0, r8
  JMP wall_check

dir_up:
  LDI r8, 1
  SUB r4, r8
  JMP wall_check

dir_right:
  LDI r8, 1
  ADD r0, r8
  JMP wall_check

dir_down:
  LDI r8, 1
  ADD r4, r8

wall_check:
  ; x >= 32 -> hit
  LDI r8, 32
  CMP r0, r8
  BGE r15, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r8, 0
  CMP r0, r8
  BLT r15, do_wall_hit
  ; y < 0
  CMP r4, r8
  BLT r15, do_wall_hit
  ; y >= 32
  LDI r8, 32
  CMP r4, r8
  BGE r15, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r8, 8
  LDI r9, 0
  ADD r9, r0
  SHL r9, r8
  OR r9, r4

  ; advance head index (mod 512)
  LDI r14, 0x2200
  LOAD r6, r14
  LDI r8, 1
  ADD r6, r8
  LDI r8, 0x1FF
  AND r6, r8
  STORE r14, r6

  ; store new head cell
  LDI r14, 0x2000
  ADD r14, r6
  STORE r14, r9

  ; check apple: compare new head_x with apple_x
  LDI r14, 0x2203
  LOAD r20, r14          ; apple_x
  LDI r14, 0x2204
  LOAD r21, r14          ; apple_y
  CMP r0, r20
  JZ r15, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r4, r21
  JZ r15, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r14, 0x2201
  LOAD r22, r14
  LDI r8, 1
  ADD r22, r8
  LDI r8, 0x1FF
  AND r22, r8
  LDI r14, 0x2201
  STORE r14, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r14, 0x2202
  LOAD r8, r14
  LDI r20, 1
  ADD r8, r20
  STORE r14, r8
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r12, 880
  LDI r2, 60
  BEEP r12, r2
  POP r31
  RET

do_wall_hit:
  LDI r13, 1
  LDI r14, 0x2206
  STORE r14, r13
  ; death sound: 110 Hz, 300 ms
  LDI r12, 110
  LDI r2, 300
  BEEP r12, r2
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r13
  LDI r5, 31
  AND r13, r5
  LDI r14, 0x2203
  STORE r14, r13
  RAND r13
  AND r13, r5
  LDI r14, 0x2204
  STORE r14, r13
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r13, 0x001008
  FILL r13

  ; draw apple (red 8x8 block)
  LDI r14, 0x2203
  LOAD r5, r14           ; apple_x
  LDI r14, 0x2204
  LOAD r3, r14           ; apple_y
  LDI r8, 8
  MUL r5, r8            ; px_x
  MUL r3, r8            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r5, r3, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r14, 0x2201
  LOAD r6, r14           ; r6 = tail index
  LDI r14, 0x2202
  LOAD r25, r14           ; r25 = length (loop counter)

draw_loop:
  LDI r14, 0x2000
  ADD r14, r6
  LOAD r13, r14            ; r13 = cell = (x<<8)|y

  ; x = r13 >> 8
  LDI r8, 8
  LDI r5, 0
  ADD r5, r13
  SHR r5, r8             ; r5 = x

  ; y = r13 & 0xFF
  LDI r3, 0xFF
  AND r3, r13             ; r3 = y

  ; pixel coords
  LDI r8, 8
  MUL r5, r8
  MUL r3, r8

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r5, r3, r22, r23, r24

  ; advance ring buffer index
  LDI r8, 1
  ADD r6, r8
  LDI r8, 0x1FF
  AND r6, r8

  ; decrement counter and loop
  LDI r8, 1
  SUB r25, r8
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
