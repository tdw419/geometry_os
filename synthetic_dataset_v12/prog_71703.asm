; DESCRIPTION: Places a black line segment connecting (306, 227) to (212, 229).
; PLAN: r0=306(x1), r1=227(y1), r2=212(x2), r3=229(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 227
LDI r2, 212
LDI r3, 229
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
