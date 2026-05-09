; DESCRIPTION: Places a yellow line segment connecting (74, 232) to (123, 31).
; PLAN: r0=74(x1), r1=232(y1), r2=123(x2), r3=31(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 232
LDI r2, 123
LDI r3, 31
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
