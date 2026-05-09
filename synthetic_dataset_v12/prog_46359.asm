; DESCRIPTION: Places a yellow line segment connecting (297, 185) to (7, 78).
; PLAN: r0=297(x1), r1=185(y1), r2=7(x2), r3=78(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 185
LDI r2, 7
LDI r3, 78
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
