; DESCRIPTION: Places a yellow line segment connecting (117, 62) to (129, 247).
; PLAN: r0=117(x1), r1=62(y1), r2=129(x2), r3=247(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 117
LDI r1, 62
LDI r2, 129
LDI r3, 247
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
