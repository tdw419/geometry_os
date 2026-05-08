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
  LDI r14, 0x2000
  LDI r6, 8

  LDI r8, 14
  SHL r8, r6
  LDI r12, 16
  OR r8, r12
  STORE r14, r8        ; body[0] = (14,16)

  LDI r8, 15
  SHL r8, r6
  OR r8, r12
  LDI r14, 0x2001
  STORE r14, r8        ; body[1] = (15,16)

  LDI r8, 16
  SHL r8, r6
  OR r8, r12
  LDI r14, 0x2002
  STORE r14, r8        ; body[2] = (16,16)

  LDI r8, 2
  LDI r14, 0x2200
  STORE r14, r8        ; head = 2
  LDI r8, 0
  LDI r14, 0x2201
  STORE r14, r8        ; tail = 0
  LDI r8, 3
  LDI r14, 0x2202
  STORE r14, r8        ; length = 3

  LDI r8, 1           ; direction = right
  LDI r14, 0x2205
  STORE r14, r8

  LDI r8, 0           ; game_over = 0
  LDI r14, 0x2206
  STORE r14, r8

  CALL place_apple

; ── main loop ────────────────────────────────────────────────────
game_loop:
  ; check game over
  LDI r14, 0x2206
  LOAD r8, r14
  JNZ r8, game_over_screen

  ; read key and update direction (cannot reverse)
  IKEY r9

  LDI r3, 87          ; W / w = up
  CMP r9, r3
  JZ r10, try_up
  LDI r3, 119
  CMP r9, r3
  JZ r10, try_up

  LDI r3, 68          ; D / d = right
  CMP r9, r3
  JZ r10, try_right
  LDI r3, 100
  CMP r9, r3
  JZ r10, try_right

  LDI r3, 83          ; S / s = down
  CMP r9, r3
  JZ r10, try_down
  LDI r3, 115
  CMP r9, r3
  JZ r10, try_down

  LDI r3, 65          ; A / a = left
  CMP r9, r3
  JZ r10, try_left
  LDI r3, 97
  CMP r9, r3
  JZ r10, try_left

after_input:
  ; throttle: only move snake every 8 frames (~7.5 moves/sec at 60fps)
  LDI r14, 0xFFE
  LOAD r1, r14           ; r1 = TICKS
  LDI r6, 7
  AND r1, r6            ; r1 = TICKS & 7
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
  LOAD r3, r14
  LDI r6, 2
  CMP r3, r6
  JZ r10, after_input  ; refuse if going down
  LDI r8, 0
  STORE r14, r8
  JMP after_input

try_right:
  LDI r14, 0x2205
  LOAD r3, r14
  LDI r6, 3
  CMP r3, r6
  JZ r10, after_input  ; refuse if going left
  LDI r8, 1
  STORE r14, r8
  JMP after_input

try_down:
  LDI r14, 0x2205
  LOAD r3, r14
  LDI r6, 0
  CMP r3, r6
  JZ r10, after_input  ; refuse if going up
  LDI r8, 2
  STORE r14, r8
  JMP after_input

try_left:
  LDI r14, 0x2205
  LOAD r3, r14
  LDI r6, 1
  CMP r3, r6
  JZ r10, after_input  ; refuse if going right
  LDI r8, 3
  STORE r14, r8
  JMP after_input

; ── game over screen ─────────────────────────────────────────────
game_over_screen:
  LDI r8, 0x550000
  FILL r8
  FRAME
  IKEY r9
  JZ r9, game_over_screen
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
  LOAD r15, r14         ; r15 = head index
  LDI r14, 0x2000
  ADD r14, r15
  LOAD r2, r14         ; r2 = head cell = (x<<8)|y

  ; decode head x (r4), y (r7)
  LDI r6, 8
  LDI r4, 0
  ADD r4, r2
  SHR r4, r6          ; r4 = x
  LDI r6, 0xFF
  LDI r7, 0
  ADD r7, r2
  AND r7, r6          ; r7 = y

  ; load direction
  LDI r14, 0x2205
  LOAD r11, r14

  LDI r6, 0
  CMP r11, r6
  JZ r10, dir_up
  LDI r6, 1
  CMP r11, r6
  JZ r10, dir_right
  LDI r6, 2
  CMP r11, r6
  JZ r10, dir_down
  ; left: x -= 1
  LDI r6, 1
  SUB r4, r6
  JMP wall_check

dir_up:
  LDI r6, 1
  SUB r7, r6
  JMP wall_check

dir_right:
  LDI r6, 1
  ADD r4, r6
  JMP wall_check

dir_down:
  LDI r6, 1
  ADD r7, r6

wall_check:
  ; x >= 32 -> hit
  LDI r6, 32
  CMP r4, r6
  BGE r10, do_wall_hit
  ; x < 0 (signed underflow -> large u32) -> hit
  LDI r6, 0
  CMP r4, r6
  BLT r10, do_wall_hit
  ; y < 0
  CMP r7, r6
  BLT r10, do_wall_hit
  ; y >= 32
  LDI r6, 32
  CMP r7, r6
  BGE r10, do_wall_hit

  ; encode new head: (x<<8)|y
  LDI r6, 8
  LDI r2, 0
  ADD r2, r4
  SHL r2, r6
  OR r2, r7

  ; advance head index (mod 512)
  LDI r14, 0x2200
  LOAD r15, r14
  LDI r6, 1
  ADD r15, r6
  LDI r6, 0x1FF
  AND r15, r6
  STORE r14, r15

  ; store new head cell
  LDI r14, 0x2000
  ADD r14, r15
  STORE r14, r2

  ; check apple: compare new head_x with apple_x
  LDI r14, 0x2203
  LOAD r20, r14          ; apple_x
  LDI r14, 0x2204
  LOAD r21, r14          ; apple_y
  CMP r4, r20
  JZ r10, check_apple_y
  JMP advance_tail

check_apple_y:
  CMP r7, r21
  JZ r10, do_eat_apple

advance_tail:
  ; not eating: advance tail
  LDI r14, 0x2201
  LOAD r22, r14
  LDI r6, 1
  ADD r22, r6
  LDI r6, 0x1FF
  AND r22, r6
  LDI r14, 0x2201
  STORE r14, r22
  POP r31
  RET

do_eat_apple:
  ; grow: increment length
  LDI r14, 0x2202
  LOAD r6, r14
  LDI r20, 1
  ADD r6, r20
  STORE r14, r6
  CALL place_apple
  ; eat sound: 880 Hz, 60 ms
  LDI r5, 880
  LDI r3, 60
  BEEP r5, r3
  POP r31
  RET

do_wall_hit:
  LDI r8, 1
  LDI r14, 0x2206
  STORE r14, r8
  ; death sound: 110 Hz, 300 ms
  LDI r5, 110
  LDI r3, 300
  BEEP r5, r3
  POP r31
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: place_apple -- pick random cell (0-31, 0-31)
; ─────────────────────────────────────────────────────────────────
place_apple:
  RAND r8
  LDI r12, 31
  AND r8, r12
  LDI r14, 0x2203
  STORE r14, r8
  RAND r8
  AND r8, r12
  LDI r14, 0x2204
  STORE r14, r8
  RET

; ─────────────────────────────────────────────────────────────────
; SUBROUTINE: draw_frame -- clear, draw apple, draw snake body
;   No nested calls, r31 safe.
; ─────────────────────────────────────────────────────────────────
draw_frame:
  ; clear dark background
  LDI r8, 0x001008
  FILL r8

  ; draw apple (red 8x8 block)
  LDI r14, 0x2203
  LOAD r12, r14           ; apple_x
  LDI r14, 0x2204
  LOAD r13, r14           ; apple_y
  LDI r6, 8
  MUL r12, r6            ; px_x
  MUL r13, r6            ; px_y
  LDI r22, 8
  LDI r23, 8
  LDI r24, 0xFF2200
  RECTF r12, r13, r22, r23, r24

  ; draw snake body: iterate ring buffer from tail, length times
  LDI r14, 0x2201
  LOAD r15, r14           ; r15 = tail index
  LDI r14, 0x2202
  LOAD r25, r14           ; r25 = length (loop counter)

draw_loop:
  LDI r14, 0x2000
  ADD r14, r15
  LOAD r8, r14            ; r8 = cell = (x<<8)|y

  ; x = r8 >> 8
  LDI r6, 8
  LDI r12, 0
  ADD r12, r8
  SHR r12, r6             ; r12 = x

  ; y = r8 & 0xFF
  LDI r13, 0xFF
  AND r13, r8             ; r13 = y

  ; pixel coords
  LDI r6, 8
  MUL r12, r6
  MUL r13, r6

  ; draw 7x7 green cell (1px gap gives grid look)
  LDI r22, 7
  LDI r23, 7
  LDI r24, 0x00CC44
  RECTF r12, r13, r22, r23, r24

  ; advance ring buffer index
  LDI r6, 1
  ADD r15, r6
  LDI r6, 0x1FF
  AND r15, r6

  ; decrement counter and loop
  LDI r6, 1
  SUB r25, r6
  JZ r25, draw_done
  JMP draw_loop

draw_done:
  RET
