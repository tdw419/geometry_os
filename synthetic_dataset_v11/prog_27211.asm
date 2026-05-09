; DESCRIPTION: Places a yellow line segment connecting (134, 240) to (91, 62).
; PLAN: r0=134(x1), r1=240(y1), r2=91(x2), r3=62(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 240
LDI r2, 91
LDI r3, 62
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
