; DESCRIPTION: Draws a blue line from (158, 182) to (328, 194).
; PLAN: r0=158(x1), r1=182(y1), r2=328(x2), r3=194(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 182
LDI r2, 328
LDI r3, 194
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
