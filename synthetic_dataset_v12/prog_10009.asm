; DESCRIPTION: Draws a blue line from (53, 175) to (456, 153).
; PLAN: r0=53(x1), r1=175(y1), r2=456(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 53
LDI r1, 175
LDI r2, 456
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
