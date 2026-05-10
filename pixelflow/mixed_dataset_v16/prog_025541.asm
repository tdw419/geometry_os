; DESCRIPTION: Draws a blue line from (93, 159) to (491, 97).
; PLAN: r0=93(x1), r1=159(y1), r2=491(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 159
LDI r2, 491
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
