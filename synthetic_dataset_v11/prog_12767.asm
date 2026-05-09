; DESCRIPTION: Places a yellow line segment connecting (70, 139) to (238, 86).
; PLAN: r0=70(x1), r1=139(y1), r2=238(x2), r3=86(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 139
LDI r2, 238
LDI r3, 86
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
