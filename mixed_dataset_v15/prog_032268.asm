; DESCRIPTION: Places a blue line segment connecting (60, 196) to (339, 188).
; PLAN: r0=60(x1), r1=196(y1), r2=339(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 196
LDI r2, 339
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
