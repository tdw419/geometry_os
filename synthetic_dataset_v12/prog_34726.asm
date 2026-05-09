; DESCRIPTION: Places a yellow line segment connecting (247, 123) to (11, 29).
; PLAN: r0=247(x1), r1=123(y1), r2=11(x2), r3=29(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 123
LDI r2, 11
LDI r3, 29
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
