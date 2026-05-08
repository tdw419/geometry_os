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
  LDI r7, 0x2000
  LDI r12, 8

  LDI r6, 14
  SHL r6, r12
  LDI r11, 16
  OR r6, r11
  STORE r7, r6        ; body[0] = (14,16)

  LDI r6, 15
  SHL r6, r12
  OR r6, r11
  LDI r7, 0x2001
  STORE r7, r6        ; body[1] = (15,16)

  LDI r6, 16
  SHL r6, r12
  OR r6, r11
  LDI r7, 0x2002
  STORE r7, r6        ; body[2] = (16,16)

  LDI r6, 2
  LDI r7, 0x2200
  STORE r7, r6        ; head = 2
  LDI r6, 0
  LDI r7, 0x2201
  STORE r7, r6        ; tail = 0
  LDI r6, 3
  LDI r7, 0x2202
  STORE r7, r6        ; length = 3

  LDI r6, 1           ; direction = right
  LDI r7, 0x2205
  STORE r7, r6

  LDI r6, 0           ; game_over = 0
  LDI r7, 0x2206
  STORE r7, r6

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r7, 0x2206
  LOAD r6, r7
  JNZ r6, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r0

  LDI r15, 87          ; W / w = up
  CMP r0, r15
  JZ r13, try_up
  LDI r15, 119
  CMP r0, r15
  JZ r13, try_up

  LDI r15, 68          ; D / d = right
  CMP r0, r15
  JZ r13, try_right
  LDI r15, 100
  CMP r0, r15
  JZ r13, try_right

  LDI r15, 83          ; S / s = down
  CMP r0, r15
  JZ r13, try_down
  LDI r15, 115
  CMP r0, r15
  JZ r13, try_down

  LDI r15, 65          ; A / a = left
  CMP r0, r15
  JZ r13, try_left
  LDI r15, 97
  CMP r0, r15
  JZ r13, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r7, 0xFFE
  LOAD r8, r7           ; r8 = TICKS
  LDI r12, 7
  AND r8, r12            ; r8 = TICKS & 7
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
  LDI r7, 0x2205
  LOAD r15, r7
  LDI r12, 2
  CMP r15, r12
  JZ r13, after_input  ; refuse if going down
  LDI r6, 0
  STORE r7, r6
  JMP after_input

try_right:
  LDI r7, 0x2205
  LOAD r15, r7
  LDI r12, 3
  CMP r15, r12
  JZ r13, after_input  ; refuse if going left
  LDI r6, 1
  STORE r7, r6
  JMP after_input

try_down:
  LDI r7, 0x2205
  LOAD r15, r7
  LDI r12, 0
  CMP r15, r12
  JZ r13, after_input  ; refuse if going up
  LDI r6, 2
  STORE r7, r6
  JMP after_input

try_left:
  LDI r7, 0x2205
  LOAD r15, r7
  LDI r12, 1
  CMP r15, r12
  JZ r13, after_input  ; refuse if going right
  LDI r6, 3
  STORE r7, r6
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r6, 0x550000
  FILL r6
  FRAME
  IKEY r0
  JZ r0, game_over_screen
  JMP restart

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: move_snake
;   Reads direction, computes new head, checks walls + apple.
;   PUSH/POP r31 because we may nested-call place_apple.
; ─────────────────────────────────────────────────────────────────
move_snake:
  PUSH r31

  ; load head cell
  LDI r7, 0x2200
  LOAD r3, r7         ; r3 = head index
  LDI r7, 0x2000
  ADD r7, r3
  LOAD r14, r7         ; r14 = head cell = (x<<8)|y

  ; decode head x (r5), y (r9)
  LDI r12, 8
  LDI r5, 0
  ADD r5, r14
  SHR r5, r12          ; r5 = x
  LDI r12, 0xFF
  LDI r9, 0
  ADD r9, r14
  AND r9, r12          ; r9 = y

  ; load direction
  LDI r7, 0x2205
  LOAD r2, r7

  LDI r12, 0
  CMP r2, r12
  JZ r13, dir_up
  LDI r12, 1
  CMP r2, r12
  JZ r13, dir_right
  LDI r12, 2
  CMP r2, r12
  JZ r13, dir_down
  ; left: x -= 1
  LDI r12, 1
  SUB r5, r12
  JMP wall_check

dir_up:
  LDI r12, 1
  SUB r9, r12
  JMP wall_check

dir_right:
  LDI r12, 1
  ADD r5, r12
  JMP wall_check

dir_down:
  LDI r12, 1
  ADD r9, r12

wall_check:
  ; x >= 32 -> hit
  LDI r12, 32
  CMP r5, r12
  BGE r13, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r12, 0
  CMP r5, r12
  BLT r13, do_wall_hit
  ; y < 0
  CMP r9, r12
  BLT r13, do_wall_hit
  ; y >= 32
  LDI r12, 32
  CMP r9, r12
  BGE r13, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r12, 8
  LDI r14, 0
  ADD r14, r5
  SHL r14, r12
  OR r14, r9

  ; advance head index (mod 512)
  LDI r7, 0x2200
  LOAD r3, r7
  LDI r12, 1
  ADD r3, r12
  LDI r12, 0x1FF
  AND r3, r12
  STORE r7, r3

  ; store new head cell
  LDI r7, 0x2000
  ADD r7, r3
  STORE r7, r14

  ; check apple: compare new head_x with apple_x
  LDI r7, 0x2203
  LOAD r20, r7          ; apple_x
  LDI r7, 0x2204
  LOAD r21, r7          ; apple_y
  CMP r5, r20
  JZ r13, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r9, r21
  JZ r13, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r7, 0x2201
  LOAD r22, r7
  LDI r12, 1
  ADD r22, r12
  LDI r12, 0x1FF
  AND r22, r12
  LDI r7, 0x2201
  STORE r7, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r7, 0x2202
  LOAD r12, r7
  LDI r20, 1
  ADD r12, r20
  STORE r7, r12
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r4, 880
  LDI r15, 60
  BEEP r4, r15
  POP r31
  RET

do_wall_hit:
  LDI r6, 1
  LDI r7, 0x2206
  STORE r7, r6
  ; death sound: 110 Hz, 300 ms
  LDI r4, 110
  LDI r15, 300
  BEEP r4, r15
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r6
  LDI r11, 31
  AND r6, r11
  LDI r7, 0x2203
  STORE r7, r6
  RAND r6
  AND r6, r11
  LDI r7, 0x2204
  STORE r7, r6
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r6, 0x001008
  FILL r6

  ; draw apple (red 8x8 block)
  LDI r7, 0x2203
  LOAD r11, r7           ; apple_x
  LDI r7, 0x2204
  LOAD r1, r7           ; apple_y
  LDI r12, 8
  MUL r11, r12            ; px_x
  MUL r1, r12            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r11, r1, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r7, 0x2201
  LOAD r3, r7           ; r3 = tail index
  LDI r7, 0x2202
  LOAD r25, r7           ; r25 = length (loop counter)

draw_loop:
  LDI r7, 0x2000
  ADD r7, r3
  LOAD r6, r7            ; r6 = cell = (x<<8)|y

  ; x = r6 >> 8
  LDI r12, 8
  LDI r11, 0
  ADD r11, r6
  SHR r11, r12             ; r11 = x

  ; y = r6 & 0xFF
  LDI r1, 0xFF
  AND r1, r6             ; r1 = y

  ; pixel coords
  LDI r12, 8
  MUL r11, r12
  MUL r1, r12

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r11, r1, r22, r23, r24

  ; advance ring buffer index
  LDI r12, 1
  ADD r3, r12
  LDI r12, 0x1FF
  AND r3, r12

  ; decrement counter and loop
  LDI r12, 1
  SUB r25, r12
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
