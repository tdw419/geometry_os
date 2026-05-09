; DESCRIPTION: Places a red line segment connecting (130, 153) to (100, 184).
; PLAN: r0=130(x1), r1=153(y1), r2=100(x2), r3=184(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 153
LDI r2, 100
LDI r3, 184
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
