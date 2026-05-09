; DESCRIPTION: Places a yellow line segment connecting (8, 216) to (6, 32).
; PLAN: r0=8(x1), r1=216(y1), r2=6(x2), r3=32(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 216
LDI r2, 6
LDI r3, 32
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
