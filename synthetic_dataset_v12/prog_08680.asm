; DESCRIPTION: Draws a blue line from (486, 235) to (53, 97).
; PLAN: r0=486(x1), r1=235(y1), r2=53(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 235
LDI r2, 53
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
