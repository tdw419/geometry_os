; DESCRIPTION: Places a green line segment connecting (197, 158) to (155, 157).
; PLAN: r0=197(x1), r1=158(y1), r2=155(x2), r3=157(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 197
LDI r1, 158
LDI r2, 155
LDI r3, 157
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
