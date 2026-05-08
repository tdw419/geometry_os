; DESCRIPTION: Display a rectangle using color colored at the screen.

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
  LDI r9, 0x2000
  LDI r12, 8

  LDI r11, 14
  SHL r11, r12
  LDI r4, 16
  OR r11, r4
  STORE r9, r11        ; body[0] = (14,16)

  LDI r11, 15
  SHL r11, r12
  OR r11, r4
  LDI r9, 0x2001
  STORE r9, r11        ; body[1] = (15,16)

  LDI r11, 16
  SHL r11, r12
  OR r11, r4
  LDI r9, 0x2002
  STORE r9, r11        ; body[2] = (16,16)

  LDI r11, 2
  LDI r9, 0x2200
  STORE r9, r11        ; head = 2
  LDI r11, 0
  LDI r9, 0x2201
  STORE r9, r11        ; tail = 0
  LDI r11, 3
  LDI r9, 0x2202
  STORE r9, r11        ; length = 3

  LDI r11, 1           ; direction = right
  LDI r9, 0x2205
  STORE r9, r11

  LDI r11, 0           ; game_over = 0
  LDI r9, 0x2206
  STORE r9, r11

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r9, 0x2206
  LOAD r11, r9
  JNZ r11, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r7

  LDI r15, 87          ; W / w = up
  CMP r7, r15
  JZ r13, try_up
  LDI r15, 119
  CMP r7, r15
  JZ r13, try_up

  LDI r15, 68          ; D / d = right
  CMP r7, r15
  JZ r13, try_right
  LDI r15, 100
  CMP r7, r15
  JZ r13, try_right

  LDI r15, 83          ; S / s = down
  CMP r7, r15
  JZ r13, try_down
  LDI r15, 115
  CMP r7, r15
  JZ r13, try_down

  LDI r15, 65          ; A / a = left
  CMP r7, r15
  JZ r13, try_left
  LDI r15, 97
  CMP r7, r15
  JZ r13, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r9, 0xFFE
  LOAD r2, r9           ; r2 = TICKS
  LDI r12, 7
  AND r2, r12            ; r2 = TICKS & 7
  JZ r2, do_move        ; move on frame 0, 8, 16, ...
  CALL draw_frame
  FRAME
  JMP game_loop

do_move:
  CALL move_snake
  CALL draw_frame
  FRAME
  JMP game_loop

try_up:
  LDI r9, 0x2205
  LOAD r15, r9
  LDI r12, 2
  CMP r15, r12
  JZ r13, after_input  ; refuse if going down
  LDI r11, 0
  STORE r9, r11
  JMP after_input

try_right:
  LDI r9, 0x2205
  LOAD r15, r9
  LDI r12, 3
  CMP r15, r12
  JZ r13, after_input  ; refuse if going left
  LDI r11, 1
  STORE r9, r11
  JMP after_input

try_down:
  LDI r9, 0x2205
  LOAD r15, r9
  LDI r12, 0
  CMP r15, r12
  JZ r13, after_input  ; refuse if going up
  LDI r11, 2
  STORE r9, r11
  JMP after_input

try_left:
  LDI r9, 0x2205
  LOAD r15, r9
  LDI r12, 1
  CMP r15, r12
  JZ r13, after_input  ; refuse if going right
  LDI r11, 3
  STORE r9, r11
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r11, 0x550000
  FILL r11
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
  LDI r9, 0x2200
  LOAD r3, r9         ; r3 = head index
  LDI r9, 0x2000
  ADD r9, r3
  LOAD r14, r9         ; r14 = head cell = (x<<8)|y

  ; decode head x (r1), y (r6)
  LDI r12, 8
  LDI r1, 0
  ADD r1, r14
  SHR r1, r12          ; r1 = x
  LDI r12, 0xFF
  LDI r6, 0
  ADD r6, r14
  AND r6, r12          ; r6 = y

  ; load direction
  LDI r9, 0x2205
  LOAD r5, r9

  LDI r12, 0
  CMP r5, r12
  JZ r13, dir_up
  LDI r12, 1
  CMP r5, r12
  JZ r13, dir_right
  LDI r12, 2
  CMP r5, r12
  JZ r13, dir_down
  ; left: x -= 1
  LDI r12, 1
  SUB r1, r12
  JMP wall_check

dir_up:
  LDI r12, 1
  SUB r6, r12
  JMP wall_check

dir_right:
  LDI r12, 1
  ADD r1, r12
  JMP wall_check

dir_down:
  LDI r12, 1
  ADD r6, r12

wall_check:
  ; x >= 32 -> hit
  LDI r12, 32
  CMP r1, r12
  BGE r13, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r12, 0
  CMP r1, r12
  BLT r13, do_wall_hit
  ; y < 0
  CMP r6, r12
  BLT r13, do_wall_hit
  ; y >= 32
  LDI r12, 32
  CMP r6, r12
  BGE r13, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r12, 8
  LDI r14, 0
  ADD r14, r1
  SHL r14, r12
  OR r14, r6

  ; advance head index (mod 512)
  LDI r9, 0x2200
  LOAD r3, r9
  LDI r12, 1
  ADD r3, r12
  LDI r12, 0x1FF
  AND r3, r12
  STORE r9, r3

  ; store new head cell
  LDI r9, 0x2000
  ADD r9, r3
  STORE r9, r14

  ; check apple: compare new head_x with apple_x
  LDI r9, 0x2203
  LOAD r20, r9          ; apple_x
  LDI r9, 0x2204
  LOAD r21, r9          ; apple_y
  CMP r1, r20
  JZ r13, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r6, r21
  JZ r13, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r9, 0x2201
  LOAD r22, r9
  LDI r12, 1
  ADD r22, r12
  LDI r12, 0x1FF
  AND r22, r12
  LDI r9, 0x2201
  STORE r9, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r9, 0x2202
  LOAD r12, r9
  LDI r20, 1
  ADD r12, r20
  STORE r9, r12
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r10, 880
  LDI r15, 60
  BEEP r10, r15
  POP r31
  RET

do_wall_hit:
  LDI r11, 1
  LDI r9, 0x2206
  STORE r9, r11
  ; death sound: 110 Hz, 300 ms
  LDI r10, 110
  LDI r15, 300
  BEEP r10, r15
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r11
  LDI r4, 31
  AND r11, r4
  LDI r9, 0x2203
  STORE r9, r11
  RAND r11
  AND r11, r4
  LDI r9, 0x2204
  STORE r9, r11
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r11, 0x001008
  FILL r11

  ; draw apple (red 8x8 block)
  LDI r9, 0x2203
  LOAD r4, r9           ; apple_x
  LDI r9, 0x2204
  LOAD r8, r9           ; apple_y
  LDI r12, 8
  MUL r4, r12            ; px_x
  MUL r8, r12            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r4, r8, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r9, 0x2201
  LOAD r3, r9           ; r3 = tail index
  LDI r9, 0x2202
  LOAD r25, r9           ; r25 = length (loop counter)

draw_loop:
  LDI r9, 0x2000
  ADD r9, r3
  LOAD r11, r9            ; r11 = cell = (x<<8)|y

  ; x = r11 >> 8
  LDI r12, 8
  LDI r4, 0
  ADD r4, r11
  SHR r4, r12             ; r4 = x

  ; y = r11 & 0xFF
  LDI r8, 0xFF
  AND r8, r11             ; r8 = y

  ; pixel coords
  LDI r12, 8
  MUL r4, r12
  MUL r8, r12

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r4, r8, r22, r23, r24

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
