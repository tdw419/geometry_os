; DESCRIPTION: Renders a orange line segment connecting (81, 72) to (353, 157).
; PLAN: r0=81(x1), r1=72(y1), r2=353(x2), r3=157(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 72
LDI r2, 353
LDI r3, 157
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
