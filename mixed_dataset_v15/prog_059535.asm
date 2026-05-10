; DESCRIPTION: Places a orange line segment connecting (274, 192) to (109, 223).
; PLAN: r0=274(x1), r1=192(y1), r2=109(x2), r3=223(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 192
LDI r2, 109
LDI r3, 223
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
