; DESCRIPTION: Places a blue line segment connecting (453, 99) to (406, 121).
; PLAN: r0=453(x1), r1=99(y1), r2=406(x2), r3=121(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 99
LDI r2, 406
LDI r3, 121
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
