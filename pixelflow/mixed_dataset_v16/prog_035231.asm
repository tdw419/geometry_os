; DESCRIPTION: Places a green line segment connecting (73, 158) to (437, 155).
; PLAN: r0=73(x1), r1=158(y1), r2=437(x2), r3=155(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 158
LDI r2, 437
LDI r3, 155
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
