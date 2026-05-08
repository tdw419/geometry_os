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
;   r0 = ball_x (fixed point: actual x = r0, but treated as signed)
;   r7 = ball_y
;   r3 = dx (velocity x, signed two's complement)
;   r6 = dy (velocity y)
;   r5 = ball color (white)
;   r8 = scratch
;   r10 = key code
;   r15 = ball radius (for CIRCLE)
;   r1 = 0 (black, for clearing)

; ── init ────────────────────────────────────────────────────────
LDI r0, 128     ; ball_x = center
LDI r7, 128     ; ball_y = center
LDI r3, 2       ; dx = 2
LDI r6, 3       ; dy = 3
LDI r5, 0xFFFFFF ; white
LDI r15, 8       ; radius 8
LDI r1, 0       ; black
LDI r20, 330    ; bounce freq (Hz)
LDI r21, 40     ; bounce dur  (ms)

; ── main loop ────────────────────────────────────────────────────
loop:
  ; clear screen
  FILL r1

  ; read keyboard
  IKEY r10

  ; A (97 lowercase or 65 uppercase) = kick left
  LDI r8, 65
  CMP r10, r8
  JZ r4, kick_left
  LDI r8, 97
  CMP r10, r8
  JZ r4, kick_left

  ; D (100 or 68) = kick right
  LDI r8, 68
  CMP r10, r8
  JZ r4, kick_right
  LDI r8, 100
  CMP r10, r8
  JZ r4, kick_right

  ; W (119 or 87) = kick up
  LDI r8, 87
  CMP r10, r8
  JZ r4, kick_up
  LDI r8, 119
  CMP r10, r8
  JZ r4, kick_up

  ; S (115 or 83) = kick down
  LDI r8, 83
  CMP r10, r8
  JZ r4, kick_down
  LDI r8, 115
  CMP r10, r8
  JZ r4, kick_down

  ; R (82 or 114) = reset
  LDI r8, 82
  CMP r10, r8
  JZ r4, do_reset
  LDI r8, 114
  CMP r10, r8
  JZ r4, do_reset

after_input:
  ; move ball
  ADD r0, r3
  ADD r7, r6

  ; ── bounce x walls ──────────────────────────────────────────
  ; if x >= 248 (255 - radius), negate dx
  LDI r8, 248
  CMP r0, r8
  BLT r4, check_x_low
  LDI r0, 248
  NEG r3
  BEEP r20, r21
  JMP check_y

check_x_low:
  ; if x <= 8 (radius), negate dx
  LDI r8, 8
  CMP r0, r8
  BGE r4, check_y
  LDI r0, 8
  NEG r3
  BEEP r20, r21

  ; ── bounce y walls ──────────────────────────────────────────
check_y:
  LDI r8, 248
  CMP r7, r8
  BLT r4, check_y_low
  LDI r7, 248
  NEG r6
  BEEP r20, r21
  JMP draw_ball

check_y_low:
  LDI r8, 8
  CMP r7, r8
  BGE r4, draw_ball
  LDI r7, 8
  NEG r6
  BEEP r20, r21

  ; ── draw ball ───────────────────────────────────────────────
draw_ball:
  CIRCLE r0, r7, r15, r5
  FRAME
  JMP loop

  ; ── kick handlers ───────────────────────────────────────────
kick_left:
  LDI r8, 3
  NEG r8
  LDI r3, 0
  ADD r3, r8
  JMP after_input

kick_right:
  LDI r3, 3
  JMP after_input

kick_up:
  LDI r8, 3
  NEG r8
  LDI r6, 0
  ADD r6, r8
  JMP after_input

kick_down:
  LDI r6, 3
  JMP after_input

do_reset:
  LDI r0, 128
  LDI r7, 128
  LDI r3, 2
  LDI r6, 3
  JMP after_input
