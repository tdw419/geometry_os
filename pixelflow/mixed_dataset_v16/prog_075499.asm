; DESCRIPTION: Places a yellow line segment connecting (376, 104) to (46, 238).
; PLAN: r0=376(x1), r1=104(y1), r2=46(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 376
LDI r1, 104
LDI r2, 46
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
