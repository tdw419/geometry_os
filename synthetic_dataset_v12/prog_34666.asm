; DESCRIPTION: Places a yellow line segment connecting (137, 116) to (60, 131).
; PLAN: r0=137(x1), r1=116(y1), r2=60(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 116
LDI r2, 60
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
