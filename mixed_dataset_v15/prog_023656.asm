; DESCRIPTION: Renders a orange line between points (289, 11) and (373, 66).
; PLAN: r0=289(x1), r1=11(y1), r2=373(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 289
LDI r1, 11
LDI r2, 373
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
