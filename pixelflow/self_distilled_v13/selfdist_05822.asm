; DESCRIPTION: Renders a orange line segment connecting (324, 152) to (20, 160).
; PLAN: r0=324(x1), r1=152(y1), r2=20(x2), r3=160(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 152
LDI r2, 20
LDI r3, 160
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
