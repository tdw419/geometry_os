; DESCRIPTION: Places a white line segment connecting (118, 167) to (7, 81).
; PLAN: r0=118(x1), r1=167(y1), r2=7(x2), r3=81(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 167
LDI r2, 7
LDI r3, 81
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
