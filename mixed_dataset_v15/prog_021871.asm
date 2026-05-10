; DESCRIPTION: Places a white line segment connecting (139, 226) to (95, 35).
; PLAN: r0=139(x1), r1=226(y1), r2=95(x2), r3=35(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 226
LDI r2, 95
LDI r3, 35
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
