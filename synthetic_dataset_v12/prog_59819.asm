; DESCRIPTION: Places a red line segment connecting (166, 73) to (100, 130).
; PLAN: r0=166(x1), r1=73(y1), r2=100(x2), r3=130(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 166
LDI r1, 73
LDI r2, 100
LDI r3, 130
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
