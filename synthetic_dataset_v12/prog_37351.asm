; DESCRIPTION: Renders a orange line between points (214, 100) and (269, 244).
; PLAN: r0=214(x1), r1=100(y1), r2=269(x2), r3=244(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 100
LDI r2, 269
LDI r3, 244
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
