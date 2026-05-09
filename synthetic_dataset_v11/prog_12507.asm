; DESCRIPTION: Places a white line segment connecting (179, 52) to (120, 118).
; PLAN: r0=179(x1), r1=52(y1), r2=120(x2), r3=118(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 179
LDI r1, 52
LDI r2, 120
LDI r3, 118
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
