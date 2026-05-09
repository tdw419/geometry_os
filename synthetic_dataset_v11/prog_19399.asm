; DESCRIPTION: Places a purple line segment connecting (125, 29) to (159, 167).
; PLAN: r0=125(x1), r1=29(y1), r2=159(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 29
LDI r2, 159
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
