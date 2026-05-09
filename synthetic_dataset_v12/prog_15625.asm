; DESCRIPTION: Places a yellow line segment connecting (501, 212) to (184, 114).
; PLAN: r0=501(x1), r1=212(y1), r2=184(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 212
LDI r2, 184
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
