; DESCRIPTION: Draws a purple line from (159, 68) to (210, 136).
; PLAN: r0=159(x1), r1=68(y1), r2=210(x2), r3=136(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 68
LDI r2, 210
LDI r3, 136
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
