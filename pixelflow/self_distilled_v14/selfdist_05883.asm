; DESCRIPTION: Renders a orange line segment connecting (211, 63) to (180, 109).
; PLAN: r0=211(x1), r1=63(y1), r2=180(x2), r3=109(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 63
LDI r2, 180
LDI r3, 109
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
