; DESCRIPTION: Places a yellow line segment connecting (311, 104) to (474, 137).
; PLAN: r0=311(x1), r1=104(y1), r2=474(x2), r3=137(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 104
LDI r2, 474
LDI r3, 137
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
