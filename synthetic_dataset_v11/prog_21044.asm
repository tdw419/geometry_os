; DESCRIPTION: Draws a blue line from (99, 182) to (33, 15).
; PLAN: r0=99(x1), r1=182(y1), r2=33(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 99
LDI r1, 182
LDI r2, 33
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
