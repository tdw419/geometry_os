; 025_smiley.asm -- Smiley face with filled yellow circle, black eyes, smile arc
; Uses loop of concentric circles for filled face effect

; --- Fill background dark blue ---
LDI r0, 0x111133
FILL r0

; --- Filled yellow face (concentric circles from radius 90 down to 0) ---
LDI r0, 128         ; cx
LDI r1, 128         ; cy
LDI r2, 90          ; radius (starts big)
LDI r3, 0xFFFF00    ; yellow

face_loop:
  CIRCLE r0, r1, r2, r3
  LDI r4, 1
  SUB r2, r4        ; radius--
  ; if radius > 0, continue
  LDI r5, 1
  SUB r5, r2        ; r5 = 1 - radius; if radius was 1, r5=0 -> done
  JNZ r5, face_loop

; --- Left eye (filled black circle, radius 8) ---
LDI r0, 100
LDI r1, 108
LDI r2, 8
LDI r3, 0x000000

eye_l:
  CIRCLE r0, r1, r2, r3
  LDI r4, 1
  SUB r2, r4
  LDI r5, 1
  SUB r5, r2
  JNZ r5, eye_l

; --- Right eye (filled black circle, radius 8) ---
LDI r0, 156
LDI r1, 108
LDI r2, 8

eye_r:
  CIRCLE r0, r1, r2, r3
  LDI r4, 1
  SUB r2, r4
  LDI r5, 1
  SUB r5, r2
  JNZ r5, eye_r

; --- Smile arc (5 line segments) ---
; Segment 1: (90, 145) to (105, 165)
LDI r0, 90
LDI r1, 145
LDI r2, 105
LDI r3, 165
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4

; Segment 2: (105, 165) to (128, 172)
LDI r0, 105
LDI r1, 165
LDI r2, 128
LDI r3, 172
LINE r0, r1, r2, r3, r4

; Segment 3: (128, 172) to (151, 165)
LDI r0, 128
LDI r1, 172
LDI r2, 151
LDI r3, 165
LINE r0, r1, r2, r3, r4

; Segment 4: (151, 165) to (166, 145)
LDI r0, 151
LDI r1, 165
LDI r2, 166
LDI r3, 145
LINE r0, r1, r2, r3, r4

HALT
