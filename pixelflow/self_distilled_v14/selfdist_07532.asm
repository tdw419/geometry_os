; DESCRIPTION: Renders a orange line segment connecting (151, 65) to (4, 50).
; PLAN: r0=151(x1), r1=65(y1), r2=4(x2), r3=50(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 65
LDI r2, 4
LDI r3, 50
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
