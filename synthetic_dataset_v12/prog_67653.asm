; DESCRIPTION: Draws a purple line from (253, 4) to (447, 10).
; PLAN: r0=253(x1), r1=4(y1), r2=447(x2), r3=10(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 253
LDI r1, 4
LDI r2, 447
LDI r3, 10
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
