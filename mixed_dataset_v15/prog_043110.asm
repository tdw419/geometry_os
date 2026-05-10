; DESCRIPTION: Renders a orange line segment connecting (356, 61) to (176, 2).
; PLAN: r0=356(x1), r1=61(y1), r2=176(x2), r3=2(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 61
LDI r2, 176
LDI r3, 2
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
