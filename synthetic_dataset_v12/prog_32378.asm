; DESCRIPTION: Places a yellow line segment connecting (319, 140) to (144, 106).
; PLAN: r0=319(x1), r1=140(y1), r2=144(x2), r3=106(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 140
LDI r2, 144
LDI r3, 106
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
