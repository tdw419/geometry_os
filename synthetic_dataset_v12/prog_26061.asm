; DESCRIPTION: Draws a magenta line from (113, 227) to (224, 245).
; PLAN: r0=113(x1), r1=227(y1), r2=224(x2), r3=245(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 227
LDI r2, 224
LDI r3, 245
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
