; DESCRIPTION: Places a blue line segment connecting (129, 194) to (139, 86).
; PLAN: r0=129(x1), r1=194(y1), r2=139(x2), r3=86(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 194
LDI r2, 139
LDI r3, 86
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
