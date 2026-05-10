; DESCRIPTION: Renders a orange line segment connecting (30, 45) to (238, 66).
; PLAN: r0=30(x1), r1=45(y1), r2=238(x2), r3=66(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 45
LDI r2, 238
LDI r3, 66
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
