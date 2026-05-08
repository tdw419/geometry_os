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
  LDI r3, 8

  LDI r0, 14
  SHL r0, r3
  LDI r12, 16
  OR r0, r12
  STORE r13, r0        ; body[0] = (14,16)

  LDI r0, 15
  SHL r0, r3
  OR r0, r12
  LDI r13, 0x2001
  STORE r13, r0        ; body[1] = (15,16)

  LDI r0, 16
  SHL r0, r3
  OR r0, r12
  LDI r13, 0x2002
  STORE r13, r0        ; body[2] = (16,16)

  LDI r0, 2
  LDI r13, 0x2200
  STORE r13, r0        ; head = 2
  LDI r0, 0
  LDI r13, 0x2201
  STORE r13, r0        ; tail = 0
  LDI r0, 3
  LDI r13, 0x2202
  STORE r13, r0        ; length = 3

  LDI r0, 1           ; direction = right
  LDI r13, 0x2205
  STORE r13, r0

  LDI r0, 0           ; game_over = 0
  LDI r13, 0x2206
  STORE r13, r0

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r13, 0x2206
  LOAD r0, r13
  JNZ r0, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r14

  LDI r6, 87          ; W / w = up
  CMP r14, r6
  JZ r2, try_up
  LDI r6, 119
  CMP r14, r6
  JZ r2, try_up

  LDI r6, 68          ; D / d = right
  CMP r14, r6
  JZ r2, try_right
  LDI r6, 100
  CMP r14, r6
  JZ r2, try_right

  LDI r6, 83          ; S / s = down
  CMP r14, r6
  JZ r2, try_down
  LDI r6, 115
  CMP r14, r6
  JZ r2, try_down

  LDI r6, 65          ; A / a = left
  CMP r14, r6
  JZ r2, try_left
  LDI r6, 97
  CMP r14, r6
  JZ r2, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r13, 0xFFE
  LOAD r5, r13           ; r5 = TICKS
  LDI r3, 7
  AND r5, r3            ; r5 = TICKS & 7
  JZ r5, do_move        ; move on frame 0, 8, 16, ...
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
  LOAD r6, r13
  LDI r3, 2
  CMP r6, r3
  JZ r2, after_input  ; refuse if going down
  LDI r0, 0
  STORE r13, r0
  JMP after_input

try_right:
  LDI r13, 0x2205
  LOAD r6, r13
  LDI r3, 3
  CMP r6, r3
  JZ r2, after_input  ; refuse if going left
  LDI r0, 1
  STORE r13, r0
  JMP after_input

try_down:
  LDI r13, 0x2205
  LOAD r6, r13
  LDI r3, 0
  CMP r6, r3
  JZ r2, after_input  ; refuse if going up
  LDI r0, 2
  STORE r13, r0
  JMP after_input

try_left:
  LDI r13, 0x2205
  LOAD r6, r13
  LDI r3, 1
  CMP r6, r3
  JZ r2, after_input  ; refuse if going right
  LDI r0, 3
  STORE r13, r0
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r0, 0x550000
  FILL r0
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
  LDI r13, 0x2200
  LOAD r7, r13         ; r7 = head index
  LDI r13, 0x2000
  ADD r13, r7
  LOAD r11, r13         ; r11 = head cell = (x<<8)|y

  ; decode head x (r9), y (r15)
  LDI r3, 8
  LDI r9, 0
  ADD r9, r11
  SHR r9, r3          ; r9 = x
  LDI r3, 0xFF
  LDI r15, 0
  ADD r15, r11
  AND r15, r3          ; r15 = y

  ; load direction
  LDI r13, 0x2205
  LOAD r10, r13

  LDI r3, 0
  CMP r10, r3
  JZ r2, dir_up
  LDI r3, 1
  CMP r10, r3
  JZ r2, dir_right
  LDI r3, 2
  CMP r10, r3
  JZ r2, dir_down
  ; left: x -= 1
  LDI r3, 1
  SUB r9, r3
  JMP wall_check

dir_up:
  LDI r3, 1
  SUB r15, r3
  JMP wall_check

dir_right:
  LDI r3, 1
  ADD r9, r3
  JMP wall_check

dir_down:
  LDI r3, 1
  ADD r15, r3

wall_check:
  ; x >= 32 -> hit
  LDI r3, 32
  CMP r9, r3
  BGE r2, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r3, 0
  CMP r9, r3
  BLT r2, do_wall_hit
  ; y < 0
  CMP r15, r3
  BLT r2, do_wall_hit
  ; y >= 32
  LDI r3, 32
  CMP r15, r3
  BGE r2, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r3, 8
  LDI r11, 0
  ADD r11, r9
  SHL r11, r3
  OR r11, r15

  ; advance head index (mod 512)
  LDI r13, 0x2200
  LOAD r7, r13
  LDI r3, 1
  ADD r7, r3
  LDI r3, 0x1FF
  AND r7, r3
  STORE r13, r7

  ; store new head cell
  LDI r13, 0x2000
  ADD r13, r7
  STORE r13, r11

  ; check apple: compare new head_x with apple_x
  LDI r13, 0x2203
  LOAD r20, r13          ; apple_x
  LDI r13, 0x2204
  LOAD r21, r13          ; apple_y
  CMP r9, r20
  JZ r2, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r15, r21
  JZ r2, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r13, 0x2201
  LOAD r22, r13
  LDI r3, 1
  ADD r22, r3
  LDI r3, 0x1FF
  AND r22, r3
  LDI r13, 0x2201
  STORE r13, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r13, 0x2202
  LOAD r3, r13
  LDI r20, 1
  ADD r3, r20
  STORE r13, r3
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r1, 880
  LDI r6, 60
  BEEP r1, r6
  POP r31
  RET

do_wall_hit:
  LDI r0, 1
  LDI r13, 0x2206
  STORE r13, r0
  ; death sound: 110 Hz, 300 ms
  LDI r1, 110
  LDI r6, 300
  BEEP r1, r6
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r0
  LDI r12, 31
  AND r0, r12
  LDI r13, 0x2203
  STORE r13, r0
  RAND r0
  AND r0, r12
  LDI r13, 0x2204
  STORE r13, r0
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r0, 0x001008
  FILL r0

  ; draw apple (red 8x8 block)
  LDI r13, 0x2203
  LOAD r12, r13           ; apple_x
  LDI r13, 0x2204
  LOAD r8, r13           ; apple_y
  LDI r3, 8
  MUL r12, r3            ; px_x
  MUL r8, r3            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r12, r8, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r13, 0x2201
  LOAD r7, r13           ; r7 = tail index
  LDI r13, 0x2202
  LOAD r25, r13           ; r25 = length (loop counter)

draw_loop:
  LDI r13, 0x2000
  ADD r13, r7
  LOAD r0, r13            ; r0 = cell = (x<<8)|y

  ; x = r0 >> 8
  LDI r3, 8
  LDI r12, 0
  ADD r12, r0
  SHR r12, r3             ; r12 = x

  ; y = r0 & 0xFF
  LDI r8, 0xFF
  AND r8, r0             ; r8 = y

  ; pixel coords
  LDI r3, 8
  MUL r12, r3
  MUL r8, r3

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r12, r8, r22, r23, r24

  ; advance ring buffer index
  LDI r3, 1
  ADD r7, r3
  LDI r3, 0x1FF
  AND r7, r3

  ; decrement counter and loop
  LDI r3, 1
  SUB r25, r3
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
