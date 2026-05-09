; DESCRIPTION: Places a magenta line segment connecting (442, 158) to (159, 74).
; PLAN: r0=442(x1), r1=158(y1), r2=159(x2), r3=74(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 158
LDI r2, 159
LDI r3, 74
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
HALT
