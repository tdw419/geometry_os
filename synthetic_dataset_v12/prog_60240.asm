; DESCRIPTION: Draws a purple line from (10, 192) to (9, 52).
; PLAN: r0=10(x1), r1=192(y1), r2=9(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 192
LDI r2, 9
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
