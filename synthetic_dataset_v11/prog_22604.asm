; DESCRIPTION: Places a yellow line segment connecting (172, 183) to (37, 187).
; PLAN: r0=172(x1), r1=183(y1), r2=37(x2), r3=187(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 183
LDI r2, 37
LDI r3, 187
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
