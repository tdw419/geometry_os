; DESCRIPTION: Renders a orange line segment connecting (54, 141) to (354, 76).
; PLAN: r0=54(x1), r1=141(y1), r2=354(x2), r3=76(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 141
LDI r2, 354
LDI r3, 76
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
