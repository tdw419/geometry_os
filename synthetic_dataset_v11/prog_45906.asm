; DESCRIPTION: Places a orange line segment connecting (247, 54) to (145, 136).
; PLAN: r0=247(x1), r1=54(y1), r2=145(x2), r3=136(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 54
LDI r2, 145
LDI r3, 136
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
