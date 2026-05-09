; DESCRIPTION: Places a blue line segment connecting (133, 77) to (187, 233).
; PLAN: r0=133(x1), r1=77(y1), r2=187(x2), r3=233(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 77
LDI r2, 187
LDI r3, 233
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
