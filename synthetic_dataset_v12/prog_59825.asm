; DESCRIPTION: Places a blue line segment connecting (302, 224) to (393, 217).
; PLAN: r0=302(x1), r1=224(y1), r2=393(x2), r3=217(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 224
LDI r2, 393
LDI r3, 217
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
