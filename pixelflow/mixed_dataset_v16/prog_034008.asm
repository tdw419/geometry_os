; DESCRIPTION: Renders a orange line between points (411, 25) and (10, 1).
; PLAN: r0=411(x1), r1=25(y1), r2=10(x2), r3=1(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 411
LDI r1, 25
LDI r2, 10
LDI r3, 1
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
