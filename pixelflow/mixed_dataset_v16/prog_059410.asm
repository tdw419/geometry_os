; DESCRIPTION: Renders a orange line between points (181, 167) and (418, 49).
; PLAN: r0=181(x1), r1=167(y1), r2=418(x2), r3=49(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 167
LDI r2, 418
LDI r3, 49
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
