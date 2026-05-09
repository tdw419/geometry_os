; DESCRIPTION: Renders a orange line between points (153, 194) and (132, 100).
; PLAN: r0=153(x1), r1=194(y1), r2=132(x2), r3=100(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 153
LDI r1, 194
LDI r2, 132
LDI r3, 100
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
