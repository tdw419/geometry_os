; DESCRIPTION: Renders a orange line between points (389, 100) and (208, 114).
; PLAN: r0=389(x1), r1=100(y1), r2=208(x2), r3=114(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 100
LDI r2, 208
LDI r3, 114
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
