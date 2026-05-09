; DESCRIPTION: Places a white line segment connecting (133, 210) to (142, 177).
; PLAN: r0=133(x1), r1=210(y1), r2=142(x2), r3=177(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 133
LDI r1, 210
LDI r2, 142
LDI r3, 177
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
