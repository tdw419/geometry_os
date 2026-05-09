; DESCRIPTION: Places a yellow line segment connecting (68, 156) to (161, 149).
; PLAN: r0=68(x1), r1=156(y1), r2=161(x2), r3=149(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 156
LDI r2, 161
LDI r3, 149
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
