; DESCRIPTION: Places a red line segment connecting (114, 177) to (238, 92).
; PLAN: r0=114(x1), r1=177(y1), r2=238(x2), r3=92(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 177
LDI r2, 238
LDI r3, 92
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
