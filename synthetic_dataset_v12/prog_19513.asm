; DESCRIPTION: Places a yellow line segment connecting (161, 91) to (240, 148).
; PLAN: r0=161(x1), r1=91(y1), r2=240(x2), r3=148(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 91
LDI r2, 240
LDI r3, 148
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
