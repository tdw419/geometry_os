; DESCRIPTION: Places a green line segment connecting (185, 148) to (238, 118).
; PLAN: r0=185(x1), r1=148(y1), r2=238(x2), r3=118(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 148
LDI r2, 238
LDI r3, 118
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
