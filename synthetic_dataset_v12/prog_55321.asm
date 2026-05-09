; DESCRIPTION: Places a blue line segment connecting (456, 241) to (19, 224).
; PLAN: r0=456(x1), r1=241(y1), r2=19(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 241
LDI r2, 19
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
