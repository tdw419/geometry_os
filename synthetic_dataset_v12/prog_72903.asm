; DESCRIPTION: Places a yellow line segment connecting (156, 158) to (121, 144).
; PLAN: r0=156(x1), r1=158(y1), r2=121(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 156
LDI r1, 158
LDI r2, 121
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
