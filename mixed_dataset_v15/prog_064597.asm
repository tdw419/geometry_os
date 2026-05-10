; DESCRIPTION: Places a yellow line segment connecting (448, 139) to (364, 68).
; PLAN: r0=448(x1), r1=139(y1), r2=364(x2), r3=68(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 139
LDI r2, 364
LDI r3, 68
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
