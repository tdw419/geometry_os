; DESCRIPTION: Places a yellow line segment connecting (207, 104) to (36, 102).
; PLAN: r0=207(x1), r1=104(y1), r2=36(x2), r3=102(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 104
LDI r2, 36
LDI r3, 102
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
