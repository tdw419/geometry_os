; DESCRIPTION: Places a yellow line segment connecting (86, 184) to (14, 45).
; PLAN: r0=86(x1), r1=184(y1), r2=14(x2), r3=45(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 184
LDI r2, 14
LDI r3, 45
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
