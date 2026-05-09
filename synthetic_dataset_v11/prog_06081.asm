; DESCRIPTION: Places a white line segment connecting (74, 101) to (155, 115).
; PLAN: r0=74(x1), r1=101(y1), r2=155(x2), r3=115(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 101
LDI r2, 155
LDI r3, 115
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
