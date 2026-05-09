; DESCRIPTION: Draws a blue line from (233, 37) to (139, 100).
; PLAN: r0=233(x1), r1=37(y1), r2=139(x2), r3=100(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 233
LDI r1, 37
LDI r2, 139
LDI r3, 100
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
