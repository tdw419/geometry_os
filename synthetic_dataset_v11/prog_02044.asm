; DESCRIPTION: Renders a blue line between points (1, 69) and (201, 188).
; PLAN: r0=1(x1), r1=69(y1), r2=201(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 1
LDI r1, 69
LDI r2, 201
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
