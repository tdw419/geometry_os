; DESCRIPTION: Places a yellow line segment connecting (181, 224) to (33, 101).
; PLAN: r0=181(x1), r1=224(y1), r2=33(x2), r3=101(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 181
LDI r1, 224
LDI r2, 33
LDI r3, 101
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
