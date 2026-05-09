; DESCRIPTION: Places a red line segment connecting (74, 136) to (175, 99).
; PLAN: r0=74(x1), r1=136(y1), r2=175(x2), r3=99(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 136
LDI r2, 175
LDI r3, 99
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
