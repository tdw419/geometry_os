; DESCRIPTION: Places a green line segment connecting (139, 32) to (35, 135).
; PLAN: r0=139(x1), r1=32(y1), r2=35(x2), r3=135(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 32
LDI r2, 35
LDI r3, 135
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
