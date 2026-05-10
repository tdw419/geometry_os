; DESCRIPTION: Draws a yellow line from (93, 148) to (116, 34).
; PLAN: r0=93(x1), r1=148(y1), r2=116(x2), r3=34(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 148
LDI r2, 116
LDI r3, 34
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
