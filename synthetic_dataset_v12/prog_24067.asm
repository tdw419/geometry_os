; DESCRIPTION: Places a red line segment connecting (343, 55) to (57, 114).
; PLAN: r0=343(x1), r1=55(y1), r2=57(x2), r3=114(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 343
LDI r1, 55
LDI r2, 57
LDI r3, 114
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
