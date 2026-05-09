; DESCRIPTION: Places a orange line segment connecting (369, 5) to (93, 47).
; PLAN: r0=369(x1), r1=5(y1), r2=93(x2), r3=47(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 5
LDI r2, 93
LDI r3, 47
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
