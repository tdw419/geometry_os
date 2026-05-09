; DESCRIPTION: Renders a orange line between points (44, 176) and (144, 100).
; PLAN: r0=44(x1), r1=176(y1), r2=144(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 176
LDI r2, 144
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
