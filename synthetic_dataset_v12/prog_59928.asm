; DESCRIPTION: Places a purple line segment connecting (164, 207) to (188, 148).
; PLAN: r0=164(x1), r1=207(y1), r2=188(x2), r3=148(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 207
LDI r2, 188
LDI r3, 148
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
