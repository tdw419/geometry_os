; DESCRIPTION: Draws a blue line from (137, 225) to (131, 15).
; PLAN: r0=137(x1), r1=225(y1), r2=131(x2), r3=15(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 225
LDI r2, 131
LDI r3, 15
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
