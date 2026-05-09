; DESCRIPTION: Places a blue line segment connecting (158, 184) to (86, 68).
; PLAN: r0=158(x1), r1=184(y1), r2=86(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 184
LDI r2, 86
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
