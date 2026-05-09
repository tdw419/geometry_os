; DESCRIPTION: Draws a blue line from (155, 204) to (25, 93).
; PLAN: r0=155(x1), r1=204(y1), r2=25(x2), r3=93(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 204
LDI r2, 25
LDI r3, 93
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
