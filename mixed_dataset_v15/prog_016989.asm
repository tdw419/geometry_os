; DESCRIPTION: Draws a red line from (163, 153) to (269, 194).
; PLAN: r0=163(x1), r1=153(y1), r2=269(x2), r3=194(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 153
LDI r2, 269
LDI r3, 194
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
