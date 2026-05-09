; DESCRIPTION: Places a white line segment connecting (194, 231) to (142, 77).
; PLAN: r0=194(x1), r1=231(y1), r2=142(x2), r3=77(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 231
LDI r2, 142
LDI r3, 77
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
