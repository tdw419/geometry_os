; DESCRIPTION: Places a red line segment connecting (55, 15) to (114, 77).
; PLAN: r0=55(x1), r1=15(y1), r2=114(x2), r3=77(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 15
LDI r2, 114
LDI r3, 77
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
