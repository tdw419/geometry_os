; DESCRIPTION: Draws a blue line from (306, 235) to (436, 89).
; PLAN: r0=306(x1), r1=235(y1), r2=436(x2), r3=89(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 235
LDI r2, 436
LDI r3, 89
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
