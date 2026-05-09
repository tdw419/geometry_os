; DESCRIPTION: Places a green line segment connecting (102, 104) to (85, 151).
; PLAN: r0=102(x1), r1=104(y1), r2=85(x2), r3=151(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 102
LDI r1, 104
LDI r2, 85
LDI r3, 151
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
