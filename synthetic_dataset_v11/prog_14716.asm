; DESCRIPTION: Draws a red line from (62, 182) to (247, 123).
; PLAN: r0=62(x1), r1=182(y1), r2=247(x2), r3=123(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 62
LDI r1, 182
LDI r2, 247
LDI r3, 123
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
