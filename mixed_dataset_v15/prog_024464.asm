; DESCRIPTION: Places a green line segment connecting (79, 158) to (129, 11).
; PLAN: r0=79(x1), r1=158(y1), r2=129(x2), r3=11(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 158
LDI r2, 129
LDI r3, 11
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
