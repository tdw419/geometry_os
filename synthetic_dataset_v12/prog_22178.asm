; DESCRIPTION: Renders a orange line between points (430, 58) and (136, 6).
; PLAN: r0=430(x1), r1=58(y1), r2=136(x2), r3=6(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 58
LDI r2, 136
LDI r3, 6
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
