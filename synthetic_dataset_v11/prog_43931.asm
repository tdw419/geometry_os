; DESCRIPTION: Places a blue line segment connecting (29, 35) to (77, 153).
; PLAN: r0=29(x1), r1=35(y1), r2=77(x2), r3=153(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 35
LDI r2, 77
LDI r3, 153
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
