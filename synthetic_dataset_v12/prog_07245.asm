; DESCRIPTION: Places a yellow line segment connecting (165, 62) to (22, 222).
; PLAN: r0=165(x1), r1=62(y1), r2=22(x2), r3=222(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 62
LDI r2, 22
LDI r3, 222
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
