; DESCRIPTION: Draws a white line from (289, 241) to (355, 80).
; PLAN: r0=289(x1), r1=241(y1), r2=355(x2), r3=80(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 241
LDI r2, 355
LDI r3, 80
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
