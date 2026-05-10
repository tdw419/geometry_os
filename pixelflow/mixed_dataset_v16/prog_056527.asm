; DESCRIPTION: Draws a blue line from (139, 87) to (133, 163).
; PLAN: r0=139(x1), r1=87(y1), r2=133(x2), r3=163(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 87
LDI r2, 133
LDI r3, 163
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
