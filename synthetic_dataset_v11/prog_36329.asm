; DESCRIPTION: Places a white line segment connecting (45, 118) to (149, 14).
; PLAN: r0=45(x1), r1=118(y1), r2=149(x2), r3=14(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 118
LDI r2, 149
LDI r3, 14
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
