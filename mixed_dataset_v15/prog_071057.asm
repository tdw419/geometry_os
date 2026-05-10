; DESCRIPTION: Places a blue line segment connecting (139, 75) to (28, 16).
; PLAN: r0=139(x1), r1=75(y1), r2=28(x2), r3=16(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 75
LDI r2, 28
LDI r3, 16
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
