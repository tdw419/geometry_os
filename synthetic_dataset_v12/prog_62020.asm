; DESCRIPTION: Places a orange line segment connecting (3, 154) to (108, 124).
; PLAN: r0=3(x1), r1=154(y1), r2=108(x2), r3=124(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 154
LDI r2, 108
LDI r3, 124
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
