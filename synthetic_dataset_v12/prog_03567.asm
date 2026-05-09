; DESCRIPTION: Places a yellow line segment connecting (103, 118) to (507, 24).
; PLAN: r0=103(x1), r1=118(y1), r2=507(x2), r3=24(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 118
LDI r2, 507
LDI r3, 24
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
