; DESCRIPTION: Places a orange line segment connecting (36, 11) to (289, 186).
; PLAN: r0=36(x1), r1=11(y1), r2=289(x2), r3=186(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 36
LDI r1, 11
LDI r2, 289
LDI r3, 186
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
