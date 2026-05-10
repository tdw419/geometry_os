; DESCRIPTION: Renders a orange line segment connecting (377, 191) to (378, 8).
; PLAN: r0=377(x1), r1=191(y1), r2=378(x2), r3=8(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 377
LDI r1, 191
LDI r2, 378
LDI r3, 8
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
