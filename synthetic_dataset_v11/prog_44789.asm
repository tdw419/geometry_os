; DESCRIPTION: Places a white line segment connecting (176, 118) to (75, 82).
; PLAN: r0=176(x1), r1=118(y1), r2=75(x2), r3=82(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 118
LDI r2, 75
LDI r3, 82
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
