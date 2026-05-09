; DESCRIPTION: Places a red line segment connecting (461, 73) to (77, 36).
; PLAN: r0=461(x1), r1=73(y1), r2=77(x2), r3=36(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 461
LDI r1, 73
LDI r2, 77
LDI r3, 36
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
