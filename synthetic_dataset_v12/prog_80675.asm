; DESCRIPTION: Places a green line segment connecting (161, 149) to (490, 200).
; PLAN: r0=161(x1), r1=149(y1), r2=490(x2), r3=200(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 149
LDI r2, 490
LDI r3, 200
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
