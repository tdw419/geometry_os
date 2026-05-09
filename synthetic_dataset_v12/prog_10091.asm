; DESCRIPTION: Places a orange line segment connecting (58, 223) to (376, 189).
; PLAN: r0=58(x1), r1=223(y1), r2=376(x2), r3=189(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 223
LDI r2, 376
LDI r3, 189
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
