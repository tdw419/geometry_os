; DESCRIPTION: Places a blue line segment connecting (61, 153) to (455, 188).
; PLAN: r0=61(x1), r1=153(y1), r2=455(x2), r3=188(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 153
LDI r2, 455
LDI r3, 188
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
