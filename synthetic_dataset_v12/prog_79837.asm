; DESCRIPTION: Places a orange line segment connecting (414, 58) to (328, 254).
; PLAN: r0=414(x1), r1=58(y1), r2=328(x2), r3=254(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 414
LDI r1, 58
LDI r2, 328
LDI r3, 254
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
HALT
