; DESCRIPTION: Draws a purple line from (472, 235) to (459, 8).
; PLAN: r0=472(x1), r1=235(y1), r2=459(x2), r3=8(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 235
LDI r2, 459
LDI r3, 8
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
