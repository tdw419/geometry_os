; DESCRIPTION: Places a blue line segment connecting (155, 226) to (201, 213).
; PLAN: r0=155(x1), r1=226(y1), r2=201(x2), r3=213(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 226
LDI r2, 201
LDI r3, 213
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
