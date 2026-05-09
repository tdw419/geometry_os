; DESCRIPTION: Draws a purple line from (16, 68) to (2, 224).
; PLAN: r0=16(x1), r1=68(y1), r2=2(x2), r3=224(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 16
LDI r1, 68
LDI r2, 2
LDI r3, 224
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
