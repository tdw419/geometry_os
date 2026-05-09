; DESCRIPTION: Places a white line segment connecting (149, 0) to (104, 157).
; PLAN: r0=149(x1), r1=0(y1), r2=104(x2), r3=157(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 0
LDI r2, 104
LDI r3, 157
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
