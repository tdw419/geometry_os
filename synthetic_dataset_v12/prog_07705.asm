; DESCRIPTION: Places a blue line segment connecting (287, 224) to (177, 123).
; PLAN: r0=287(x1), r1=224(y1), r2=177(x2), r3=123(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 287
LDI r1, 224
LDI r2, 177
LDI r3, 123
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
