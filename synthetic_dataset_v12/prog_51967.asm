; DESCRIPTION: Draws a blue line from (497, 235) to (441, 15).
; PLAN: r0=497(x1), r1=235(y1), r2=441(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 235
LDI r2, 441
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
