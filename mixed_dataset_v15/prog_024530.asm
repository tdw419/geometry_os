; DESCRIPTION: Places a yellow line segment connecting (138, 0) to (344, 114).
; PLAN: r0=138(x1), r1=0(y1), r2=344(x2), r3=114(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 0
LDI r2, 344
LDI r3, 114
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
