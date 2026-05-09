; DESCRIPTION: Places a yellow line segment connecting (233, 176) to (156, 144).
; PLAN: r0=233(x1), r1=176(y1), r2=156(x2), r3=144(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 176
LDI r2, 156
LDI r3, 144
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
