; DESCRIPTION: Places a blue line segment connecting (58, 12) to (140, 118).
; PLAN: r0=58(x1), r1=12(y1), r2=140(x2), r3=118(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 12
LDI r2, 140
LDI r3, 118
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
