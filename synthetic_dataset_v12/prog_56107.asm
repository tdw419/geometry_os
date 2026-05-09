; DESCRIPTION: Renders a orange line between points (222, 6) and (400, 76).
; PLAN: r0=222(x1), r1=6(y1), r2=400(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 6
LDI r2, 400
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
