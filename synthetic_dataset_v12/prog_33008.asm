; DESCRIPTION: Places a green line segment connecting (342, 123) to (197, 230).
; PLAN: r0=342(x1), r1=123(y1), r2=197(x2), r3=230(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 123
LDI r2, 197
LDI r3, 230
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
