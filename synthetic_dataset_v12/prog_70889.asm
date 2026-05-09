; DESCRIPTION: Places a blue line segment connecting (355, 253) to (462, 237).
; PLAN: r0=355(x1), r1=253(y1), r2=462(x2), r3=237(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 253
LDI r2, 462
LDI r3, 237
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
