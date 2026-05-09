; DESCRIPTION: Places a blue line segment connecting (162, 136) to (243, 47).
; PLAN: r0=162(x1), r1=136(y1), r2=243(x2), r3=47(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 136
LDI r2, 243
LDI r3, 47
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
