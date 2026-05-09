; DESCRIPTION: Places a yellow line segment connecting (105, 220) to (57, 129).
; PLAN: r0=105(x1), r1=220(y1), r2=57(x2), r3=129(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 220
LDI r2, 57
LDI r3, 129
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
