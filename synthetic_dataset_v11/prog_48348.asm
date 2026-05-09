; DESCRIPTION: Places a yellow line segment connecting (73, 115) to (167, 105).
; PLAN: r0=73(x1), r1=115(y1), r2=167(x2), r3=105(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 115
LDI r2, 167
LDI r3, 105
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
