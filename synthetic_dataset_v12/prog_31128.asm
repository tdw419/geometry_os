; DESCRIPTION: Places a black line segment connecting (276, 55) to (438, 214).
; PLAN: r0=276(x1), r1=55(y1), r2=438(x2), r3=214(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 276
LDI r1, 55
LDI r2, 438
LDI r3, 214
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
