; DESCRIPTION: Places a green line segment connecting (31, 92) to (104, 153).
; PLAN: r0=31(x1), r1=92(y1), r2=104(x2), r3=153(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 92
LDI r2, 104
LDI r3, 153
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
