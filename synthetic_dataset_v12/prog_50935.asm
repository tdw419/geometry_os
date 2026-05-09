; DESCRIPTION: Places a yellow line segment connecting (31, 118) to (337, 176).
; PLAN: r0=31(x1), r1=118(y1), r2=337(x2), r3=176(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 118
LDI r2, 337
LDI r3, 176
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
