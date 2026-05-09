; DESCRIPTION: Places a green line segment connecting (78, 76) to (14, 162).
; PLAN: r0=78(x1), r1=76(y1), r2=14(x2), r3=162(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 76
LDI r2, 14
LDI r3, 162
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
