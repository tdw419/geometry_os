; DESCRIPTION: Places a white line segment connecting (337, 115) to (118, 38).
; PLAN: r0=337(x1), r1=115(y1), r2=118(x2), r3=38(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 337
LDI r1, 115
LDI r2, 118
LDI r3, 38
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
