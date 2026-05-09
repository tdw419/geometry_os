; DESCRIPTION: Places a red line segment connecting (118, 73) to (116, 40).
; PLAN: r0=118(x1), r1=73(y1), r2=116(x2), r3=40(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 118
LDI r1, 73
LDI r2, 116
LDI r3, 40
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
