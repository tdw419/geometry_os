; DESCRIPTION: Places a green line segment connecting (94, 64) to (139, 74).
; PLAN: r0=94(x1), r1=64(y1), r2=139(x2), r3=74(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 64
LDI r2, 139
LDI r3, 74
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
