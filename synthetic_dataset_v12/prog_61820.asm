; DESCRIPTION: Places a red line segment connecting (22, 164) to (351, 53).
; PLAN: r0=22(x1), r1=164(y1), r2=351(x2), r3=53(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 164
LDI r2, 351
LDI r3, 53
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
