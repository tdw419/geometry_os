; DESCRIPTION: Places a red line segment connecting (70, 105) to (37, 233).
; PLAN: r0=70(x1), r1=105(y1), r2=37(x2), r3=233(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 105
LDI r2, 37
LDI r3, 233
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
