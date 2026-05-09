; DESCRIPTION: Draws a blue line from (55, 176) to (318, 74).
; PLAN: r0=55(x1), r1=176(y1), r2=318(x2), r3=74(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 176
LDI r2, 318
LDI r3, 74
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
