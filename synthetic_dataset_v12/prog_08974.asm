; DESCRIPTION: Draws a magenta line from (358, 224) to (162, 62).
; PLAN: r0=358(x1), r1=224(y1), r2=162(x2), r3=62(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 224
LDI r2, 162
LDI r3, 62
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
