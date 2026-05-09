; DESCRIPTION: Draws a purple line from (144, 68) to (85, 52).
; PLAN: r0=144(x1), r1=68(y1), r2=85(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 68
LDI r2, 85
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
