; DESCRIPTION: Places a blue line segment connecting (152, 62) to (334, 49).
; PLAN: r0=152(x1), r1=62(y1), r2=334(x2), r3=49(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 152
LDI r1, 62
LDI r2, 334
LDI r3, 49
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
