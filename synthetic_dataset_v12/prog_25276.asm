; DESCRIPTION: Places a yellow line segment connecting (163, 156) to (381, 253).
; PLAN: r0=163(x1), r1=156(y1), r2=381(x2), r3=253(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 156
LDI r2, 381
LDI r3, 253
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
