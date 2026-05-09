; DESCRIPTION: Draws a blue line from (448, 247) to (159, 53).
; PLAN: r0=448(x1), r1=247(y1), r2=159(x2), r3=53(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 448
LDI r1, 247
LDI r2, 159
LDI r3, 53
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
