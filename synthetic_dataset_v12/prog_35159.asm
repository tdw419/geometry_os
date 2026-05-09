; DESCRIPTION: Draws a purple line from (338, 142) to (289, 115).
; PLAN: r0=338(x1), r1=142(y1), r2=289(x2), r3=115(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 142
LDI r2, 289
LDI r3, 115
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
