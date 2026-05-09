; DESCRIPTION: Renders a orange line between points (490, 72) and (106, 182).
; PLAN: r0=490(x1), r1=72(y1), r2=106(x2), r3=182(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 490
LDI r1, 72
LDI r2, 106
LDI r3, 182
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
