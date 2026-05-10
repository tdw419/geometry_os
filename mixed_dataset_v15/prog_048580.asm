; DESCRIPTION: Draws a white line from (289, 110) to (438, 87).
; PLAN: r0=289(x1), r1=110(y1), r2=438(x2), r3=87(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 110
LDI r2, 438
LDI r3, 87
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
