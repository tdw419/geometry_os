; DESCRIPTION: Places a yellow line segment connecting (25, 246) to (83, 208).
; PLAN: r0=25(x1), r1=246(y1), r2=83(x2), r3=208(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 246
LDI r2, 83
LDI r3, 208
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
