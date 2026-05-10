; DESCRIPTION: Renders a orange line segment connecting (51, 139) to (63, 172).
; PLAN: r0=51(x1), r1=139(y1), r2=63(x2), r3=172(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 139
LDI r2, 63
LDI r3, 172
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
