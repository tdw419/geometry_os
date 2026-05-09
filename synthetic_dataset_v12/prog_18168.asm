; DESCRIPTION: Places a white line segment connecting (74, 217) to (162, 73).
; PLAN: r0=74(x1), r1=217(y1), r2=162(x2), r3=73(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 217
LDI r2, 162
LDI r3, 73
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
