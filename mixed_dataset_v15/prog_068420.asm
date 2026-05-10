; DESCRIPTION: Draws a white line from (306, 254) to (289, 137).
; PLAN: r0=306(x1), r1=254(y1), r2=289(x2), r3=137(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 254
LDI r2, 289
LDI r3, 137
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
