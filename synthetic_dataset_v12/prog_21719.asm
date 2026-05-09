; DESCRIPTION: Places a yellow line segment connecting (416, 118) to (313, 238).
; PLAN: r0=416(x1), r1=118(y1), r2=313(x2), r3=238(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 416
LDI r1, 118
LDI r2, 313
LDI r3, 238
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
