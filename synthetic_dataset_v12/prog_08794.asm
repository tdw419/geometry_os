; DESCRIPTION: Places a yellow line segment connecting (323, 175) to (24, 4).
; PLAN: r0=323(x1), r1=175(y1), r2=24(x2), r3=4(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 175
LDI r2, 24
LDI r3, 4
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
