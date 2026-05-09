; DESCRIPTION: Draws a purple line from (62, 235) to (25, 17).
; PLAN: r0=62(x1), r1=235(y1), r2=25(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 235
LDI r2, 25
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
