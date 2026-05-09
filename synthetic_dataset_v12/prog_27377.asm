; DESCRIPTION: Places a blue line segment connecting (129, 193) to (178, 130).
; PLAN: r0=129(x1), r1=193(y1), r2=178(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 193
LDI r2, 178
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
