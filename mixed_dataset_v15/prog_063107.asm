; DESCRIPTION: Renders a blue line between points (459, 26) and (490, 224).
; PLAN: r0=459(x1), r1=26(y1), r2=490(x2), r3=224(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 459
LDI r1, 26
LDI r2, 490
LDI r3, 224
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
