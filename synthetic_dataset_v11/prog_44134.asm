; DESCRIPTION: Renders a orange line between points (132, 140) and (11, 43).
; PLAN: r0=132(x1), r1=140(y1), r2=11(x2), r3=43(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 140
LDI r2, 11
LDI r3, 43
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
