; DESCRIPTION: Places a white line segment connecting (226, 80) to (104, 194).
; PLAN: r0=226(x1), r1=80(y1), r2=104(x2), r3=194(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 80
LDI r2, 104
LDI r3, 194
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
