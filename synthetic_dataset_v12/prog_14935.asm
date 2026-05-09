; DESCRIPTION: Places a red line segment connecting (462, 48) to (142, 183).
; PLAN: r0=462(x1), r1=48(y1), r2=142(x2), r3=183(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 48
LDI r2, 142
LDI r3, 183
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
