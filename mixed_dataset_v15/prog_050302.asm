; DESCRIPTION: Places a green line segment connecting (149, 241) to (216, 40).
; PLAN: r0=149(x1), r1=241(y1), r2=216(x2), r3=40(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 241
LDI r2, 216
LDI r3, 40
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
