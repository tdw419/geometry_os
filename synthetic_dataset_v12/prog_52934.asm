; DESCRIPTION: Places a yellow line segment connecting (141, 145) to (1, 246).
; PLAN: r0=141(x1), r1=145(y1), r2=1(x2), r3=246(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 145
LDI r2, 1
LDI r3, 246
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
