; DESCRIPTION: Draws a white line from (497, 136) to (289, 104).
; PLAN: r0=497(x1), r1=136(y1), r2=289(x2), r3=104(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 497
LDI r1, 136
LDI r2, 289
LDI r3, 104
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
