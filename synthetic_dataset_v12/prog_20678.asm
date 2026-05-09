; DESCRIPTION: Renders a orange line between points (170, 140) and (199, 144).
; PLAN: r0=170(x1), r1=140(y1), r2=199(x2), r3=144(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 140
LDI r2, 199
LDI r3, 144
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
