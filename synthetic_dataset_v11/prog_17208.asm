; DESCRIPTION: Draws a blue line from (114, 182) to (248, 234).
; PLAN: r0=114(x1), r1=182(y1), r2=248(x2), r3=234(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 182
LDI r2, 248
LDI r3, 234
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
