; DESCRIPTION: Renders a orange line segment connecting (68, 132) to (269, 79).
; PLAN: r0=68(x1), r1=132(y1), r2=269(x2), r3=79(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 132
LDI r2, 269
LDI r3, 79
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
