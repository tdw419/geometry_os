; DESCRIPTION: Draws a blue line from (58, 182) to (86, 60).
; PLAN: r0=58(x1), r1=182(y1), r2=86(x2), r3=60(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 58
LDI r1, 182
LDI r2, 86
LDI r3, 60
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
