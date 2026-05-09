; DESCRIPTION: Places a green line segment connecting (106, 158) to (11, 219).
; PLAN: r0=106(x1), r1=158(y1), r2=11(x2), r3=219(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 106
LDI r1, 158
LDI r2, 11
LDI r3, 219
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
