; DESCRIPTION: Places a purple line segment connecting (166, 43) to (414, 184).
; PLAN: r0=166(x1), r1=43(y1), r2=414(x2), r3=184(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 43
LDI r2, 414
LDI r3, 184
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
