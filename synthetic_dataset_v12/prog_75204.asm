; DESCRIPTION: Places a green line segment connecting (100, 104) to (37, 96).
; PLAN: r0=100(x1), r1=104(y1), r2=37(x2), r3=96(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 104
LDI r2, 37
LDI r3, 96
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
