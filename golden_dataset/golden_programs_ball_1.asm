; DESCRIPTION: Display a rectangle using color colored at the screen.

; ball.asm -- bouncing ball with keyboard control
;
; Left arrow (ASCII 68 = not available... use WASD or arrow keys)
; The VM keyboard port sends ASCII codes for printable keys.
; IKEY reads and clears the port each frame.
;
; Controls (WASD):
;   A (65) = push ball left    D (68) = push ball right
;   W (87) = push ball up      S (83) = push ball down
;   R (82) = reset ball to center
;
; Registers:
;   r3 = ball_x (fixed point: actual x = r3, but treated as signed)
;   r5 = ball_y
;   r14 = dx (velocity x, signed two's complement)
;   r4 = dy (velocity y)
;   r8 = ball color (white)
;   r13 = scratch
;   r15 = key code
;   r1 = ball radius (for CIRCLE)
;   r2 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r3, 128     ; ball_x = center
LDI r5, 128     ; ball_y = center
LDI r14, 2       ; dx = 2
LDI r4, 3       ; dy = 3
LDI r8, 0xFFFFFF ; white
LDI r1, 8       ; radius 8
LDI r2, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r2

  ; read keyboard
  IKEY r15

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r13, 65
  CMP r15, r13
  JZ r6, kick_left
  LDI r13, 97
  CMP r15, r13
  JZ r6, kick_left

  ; D (100 or 68) = kick right
  LDI r13, 68
  CMP r15, r13
  JZ r6, kick_right
  LDI r13, 100
  CMP r15, r13
  JZ r6, kick_right

  ; W (119 or 87) = kick up
  LDI r13, 87
  CMP r15, r13
  JZ r6, kick_up
  LDI r13, 119
  CMP r15, r13
  JZ r6, kick_up

  ; S (115 or 83) = kick down
  LDI r13, 83
  CMP r15, r13
  JZ r6, kick_down
  LDI r13, 115
  CMP r15, r13
  JZ r6, kick_down

  ; R (82 or 114) = reset
  LDI r13, 82
  CMP r15, r13
  JZ r6, do_reset
  LDI r13, 114
  CMP r15, r13
  JZ r6, do_reset

after_input:
  ; move ball
  ADD r3, r14
  ADD r5, r4

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r13, 248
  CMP r3, r13
  BLT r6, check_x_low
  LDI r3, 248
  NEG r14
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r13, 8
  CMP r3, r13
  BGE r6, check_y
  LDI r3, 8
  NEG r14
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r13, 248
  CMP r5, r13
  BLT r6, check_y_low
  LDI r5, 248
  NEG r4
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r13, 8
  CMP r5, r13
  BGE r6, draw_ball
  LDI r5, 8
  NEG r4
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r3, r5, r1, r8
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r13, 3
  NEG r13
  LDI r14, 0
  ADD r14, r13
  JMP after_input

kick_right:
  LDI r14, 3
  JMP after_input

kick_up:
  LDI r13, 3
  NEG r13
  LDI r4, 0
  ADD r4, r13
  JMP after_input

kick_down:
  LDI r4, 3
  JMP after_input

do_reset:
  LDI r3, 128
  LDI r5, 128
  LDI r14, 2
  LDI r4, 3
  JMP after_input
