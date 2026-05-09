; DESCRIPTION: Draws a blue line from (158, 165) to (131, 137).
; PLAN: r0=158(x1), r1=165(y1), r2=131(x2), r3=137(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 158
LDI r1, 165
LDI r2, 131
LDI r3, 137
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
