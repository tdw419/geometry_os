; DESCRIPTION: Places a red line segment connecting (114, 233) to (148, 116).
; PLAN: r0=114(x1), r1=233(y1), r2=148(x2), r3=116(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 233
LDI r2, 148
LDI r3, 116
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
