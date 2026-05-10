; DESCRIPTION: Draws a blue line from (170, 192) to (159, 85).
; PLAN: r0=170(x1), r1=192(y1), r2=159(x2), r3=85(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 192
LDI r2, 159
LDI r3, 85
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
