; DESCRIPTION: Places a blue line segment connecting (372, 188) to (15, 162).
; PLAN: r0=372(x1), r1=188(y1), r2=15(x2), r3=162(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 188
LDI r2, 15
LDI r3, 162
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
