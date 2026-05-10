; DESCRIPTION: Renders a orange line segment connecting (271, 35) to (206, 181).
; PLAN: r0=271(x1), r1=35(y1), r2=206(x2), r3=181(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 35
LDI r2, 206
LDI r3, 181
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
