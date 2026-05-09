; DESCRIPTION: Places a purple line segment connecting (456, 3) to (406, 149).
; PLAN: r0=456(x1), r1=3(y1), r2=406(x2), r3=149(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 456
LDI r1, 3
LDI r2, 406
LDI r3, 149
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
