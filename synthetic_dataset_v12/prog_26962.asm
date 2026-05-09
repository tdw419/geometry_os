; DESCRIPTION: Draws a magenta line from (224, 87) to (269, 125).
; PLAN: r0=224(x1), r1=87(y1), r2=269(x2), r3=125(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 224
LDI r1, 87
LDI r2, 269
LDI r3, 125
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
