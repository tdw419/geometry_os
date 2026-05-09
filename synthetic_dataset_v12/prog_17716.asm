; DESCRIPTION: Places a blue line segment connecting (29, 98) to (22, 68).
; PLAN: r0=29(x1), r1=98(y1), r2=22(x2), r3=68(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 98
LDI r2, 22
LDI r3, 68
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
