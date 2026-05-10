; DESCRIPTION: Places a green line segment connecting (49, 29) to (161, 114).
; PLAN: r0=49(x1), r1=29(y1), r2=161(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 29
LDI r2, 161
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
