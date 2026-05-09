; DESCRIPTION: Places a red line segment connecting (55, 159) to (102, 24).
; PLAN: r0=55(x1), r1=159(y1), r2=102(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 159
LDI r2, 102
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
