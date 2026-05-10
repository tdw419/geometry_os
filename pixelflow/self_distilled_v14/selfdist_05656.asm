; DESCRIPTION: Renders a orange line segment connecting (173, 9) to (244, 68).
; PLAN: r0=173(x1), r1=9(y1), r2=244(x2), r3=68(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 9
LDI r2, 244
LDI r3, 68
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
