; DESCRIPTION: Places a yellow line segment connecting (329, 40) to (62, 175).
; PLAN: r0=329(x1), r1=40(y1), r2=62(x2), r3=175(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 40
LDI r2, 62
LDI r3, 175
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
