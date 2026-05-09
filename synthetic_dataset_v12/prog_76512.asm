; DESCRIPTION: Places a white line segment connecting (293, 136) to (289, 199).
; PLAN: r0=293(x1), r1=136(y1), r2=289(x2), r3=199(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 136
LDI r2, 289
LDI r3, 199
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
