; DESCRIPTION: Draws a purple line from (66, 224) to (68, 212).
; PLAN: r0=66(x1), r1=224(y1), r2=68(x2), r3=212(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 224
LDI r2, 68
LDI r3, 212
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
