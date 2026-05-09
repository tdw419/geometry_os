; DESCRIPTION: Places a blue line segment connecting (22, 98) to (208, 24).
; PLAN: r0=22(x1), r1=98(y1), r2=208(x2), r3=24(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 98
LDI r2, 208
LDI r3, 24
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
