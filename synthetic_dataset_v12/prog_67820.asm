; DESCRIPTION: Places a yellow line segment connecting (138, 26) to (221, 183).
; PLAN: r0=138(x1), r1=26(y1), r2=221(x2), r3=183(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 26
LDI r2, 221
LDI r3, 183
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
