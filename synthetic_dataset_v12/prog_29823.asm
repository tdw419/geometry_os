; DESCRIPTION: Places a green line segment connecting (339, 93) to (155, 114).
; PLAN: r0=339(x1), r1=93(y1), r2=155(x2), r3=114(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 93
LDI r2, 155
LDI r3, 114
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
