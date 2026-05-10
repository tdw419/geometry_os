; DESCRIPTION: Draws a yellow line from (456, 62) to (342, 153).
; PLAN: r0=456(x1), r1=62(y1), r2=342(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 62
LDI r2, 342
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
