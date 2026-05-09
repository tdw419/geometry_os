; DESCRIPTION: Places a red line segment connecting (177, 246) to (59, 191).
; PLAN: r0=177(x1), r1=246(y1), r2=59(x2), r3=191(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 246
LDI r2, 59
LDI r3, 191
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
