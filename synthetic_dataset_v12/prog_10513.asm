; DESCRIPTION: Places a blue line segment connecting (279, 76) to (178, 130).
; PLAN: r0=279(x1), r1=76(y1), r2=178(x2), r3=130(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 76
LDI r2, 178
LDI r3, 130
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
