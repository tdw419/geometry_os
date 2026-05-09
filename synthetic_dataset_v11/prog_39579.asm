; DESCRIPTION: Places a yellow line segment connecting (34, 155) to (225, 197).
; PLAN: r0=34(x1), r1=155(y1), r2=225(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 155
LDI r2, 225
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
