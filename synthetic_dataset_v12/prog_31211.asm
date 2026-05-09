; DESCRIPTION: Draws a purple line from (506, 178) to (490, 61).
; PLAN: r0=506(x1), r1=178(y1), r2=490(x2), r3=61(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 506
LDI r1, 178
LDI r2, 490
LDI r3, 61
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
