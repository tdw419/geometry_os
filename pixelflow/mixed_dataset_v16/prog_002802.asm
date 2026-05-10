; DESCRIPTION: Renders a orange line between points (342, 105) and (511, 22).
; PLAN: r0=342(x1), r1=105(y1), r2=511(x2), r3=22(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 105
LDI r2, 511
LDI r3, 22
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
