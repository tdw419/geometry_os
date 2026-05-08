; DESCRIPTION: Geometry OS program to draw a colored rectangle.

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
;   r1 = ball_x (fixed point: actual x = r1, but treated as signed)
;   r3 = ball_y
;   r8 = dx (velocity x, signed two's complement)
;   r6 = dy (velocity y)
;   r13 = ball color (white)
;   r5 = scratch
;   r14 = key code
;   r12 = ball radius (for CIRCLE)
;   r2 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r1, 128     ; ball_x = center
LDI r3, 128     ; ball_y = center
LDI r8, 2       ; dx = 2
LDI r6, 3       ; dy = 3
LDI r13, 0xFFFFFF ; white
LDI r12, 8       ; radius 8
LDI r2, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r2

  ; read keyboard
  IKEY r14

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r5, 65
  CMP r14, r5
  JZ r10, kick_left
  LDI r5, 97
  CMP r14, r5
  JZ r10, kick_left

  ; D (100 or 68) = kick right
  LDI r5, 68
  CMP r14, r5
  JZ r10, kick_right
  LDI r5, 100
  CMP r14, r5
  JZ r10, kick_right

  ; W (119 or 87) = kick up
  LDI r5, 87
  CMP r14, r5
  JZ r10, kick_up
  LDI r5, 119
  CMP r14, r5
  JZ r10, kick_up

  ; S (115 or 83) = kick down
  LDI r5, 83
  CMP r14, r5
  JZ r10, kick_down
  LDI r5, 115
  CMP r14, r5
  JZ r10, kick_down

  ; R (82 or 114) = reset
  LDI r5, 82
  CMP r14, r5
  JZ r10, do_reset
  LDI r5, 114
  CMP r14, r5
  JZ r10, do_reset

after_input:
  ; move ball
  ADD r1, r8
  ADD r3, r6

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r5, 248
  CMP r1, r5
  BLT r10, check_x_low
  LDI r1, 248
  NEG r8
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r5, 8
  CMP r1, r5
  BGE r10, check_y
  LDI r1, 8
  NEG r8
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r5, 248
  CMP r3, r5
  BLT r10, check_y_low
  LDI r3, 248
  NEG r6
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r5, 8
  CMP r3, r5
  BGE r10, draw_ball
  LDI r3, 8
  NEG r6
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r1, r3, r12, r13
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r5, 3
  NEG r5
  LDI r8, 0
  ADD r8, r5
  JMP after_input

kick_right:
  LDI r8, 3
  JMP after_input

kick_up:
  LDI r5, 3
  NEG r5
  LDI r6, 0
  ADD r6, r5
  JMP after_input

kick_down:
  LDI r6, 3
  JMP after_input

do_reset:
  LDI r1, 128
  LDI r3, 128
  LDI r8, 2
  LDI r6, 3
  JMP after_input
