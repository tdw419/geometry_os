; DESCRIPTION: Places a white line segment connecting (246, 131) to (149, 7).
; PLAN: r0=246(x1), r1=131(y1), r2=149(x2), r3=7(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 246
LDI r1, 131
LDI r2, 149
LDI r3, 7
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
