; DESCRIPTION: Places a red line segment connecting (308, 136) to (325, 153).
; PLAN: r0=308(x1), r1=136(y1), r2=325(x2), r3=153(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 136
LDI r2, 325
LDI r3, 153
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
