; DESCRIPTION: Draws a purple line from (30, 52) to (25, 128).
; PLAN: r0=30(x1), r1=52(y1), r2=25(x2), r3=128(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 52
LDI r2, 25
LDI r3, 128
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
