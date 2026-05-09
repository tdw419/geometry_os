; DESCRIPTION: Places a green line segment connecting (91, 46) to (148, 216).
; PLAN: r0=91(x1), r1=46(y1), r2=148(x2), r3=216(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 91
LDI r1, 46
LDI r2, 148
LDI r3, 216
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
