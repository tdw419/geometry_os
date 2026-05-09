; DESCRIPTION: Places a green line segment connecting (76, 172) to (162, 100).
; PLAN: r0=76(x1), r1=172(y1), r2=162(x2), r3=100(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 172
LDI r2, 162
LDI r3, 100
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
