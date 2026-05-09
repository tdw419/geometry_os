; DESCRIPTION: Places a blue line segment connecting (162, 66) to (455, 47).
; PLAN: r0=162(x1), r1=66(y1), r2=455(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 66
LDI r2, 455
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
