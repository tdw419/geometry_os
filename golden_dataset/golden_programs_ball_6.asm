; DESCRIPTION: Draws a colored rectangle at the screen with fixed size.

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
;   r13 = ball_x (fixed point: actual x = r13, but treated as signed)
;   r11 = ball_y
;   r3 = dx (velocity x, signed two's complement)
;   r2 = dy (velocity y)
;   r14 = ball color (white)
;   r7 = scratch
;   r6 = key code
;   r8 = ball radius (for CIRCLE)
;   r4 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r13, 128     ; ball_x = center
LDI r11, 128     ; ball_y = center
LDI r3, 2       ; dx = 2
LDI r2, 3       ; dy = 3
LDI r14, 0xFFFFFF ; white
LDI r8, 8       ; radius 8
LDI r4, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r4

  ; read keyboard
  IKEY r6

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r7, 65
  CMP r6, r7
  JZ r5, kick_left
  LDI r7, 97
  CMP r6, r7
  JZ r5, kick_left

  ; D (100 or 68) = kick right
  LDI r7, 68
  CMP r6, r7
  JZ r5, kick_right
  LDI r7, 100
  CMP r6, r7
  JZ r5, kick_right

  ; W (119 or 87) = kick up
  LDI r7, 87
  CMP r6, r7
  JZ r5, kick_up
  LDI r7, 119
  CMP r6, r7
  JZ r5, kick_up

  ; S (115 or 83) = kick down
  LDI r7, 83
  CMP r6, r7
  JZ r5, kick_down
  LDI r7, 115
  CMP r6, r7
  JZ r5, kick_down

  ; R (82 or 114) = reset
  LDI r7, 82
  CMP r6, r7
  JZ r5, do_reset
  LDI r7, 114
  CMP r6, r7
  JZ r5, do_reset

after_input:
  ; move ball
  ADD r13, r3
  ADD r11, r2

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r7, 248
  CMP r13, r7
  BLT r5, check_x_low
  LDI r13, 248
  NEG r3
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r7, 8
  CMP r13, r7
  BGE r5, check_y
  LDI r13, 8
  NEG r3
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r7, 248
  CMP r11, r7
  BLT r5, check_y_low
  LDI r11, 248
  NEG r2
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r7, 8
  CMP r11, r7
  BGE r5, draw_ball
  LDI r11, 8
  NEG r2
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r13, r11, r8, r14
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r7, 3
  NEG r7
  LDI r3, 0
  ADD r3, r7
  JMP after_input

kick_right:
  LDI r3, 3
  JMP after_input

kick_up:
  LDI r7, 3
  NEG r7
  LDI r2, 0
  ADD r2, r7
  JMP after_input

kick_down:
  LDI r2, 3
  JMP after_input

do_reset:
  LDI r13, 128
  LDI r11, 128
  LDI r3, 2
  LDI r2, 3
  JMP after_input
