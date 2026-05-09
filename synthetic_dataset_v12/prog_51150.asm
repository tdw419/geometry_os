; DESCRIPTION: Places a purple line segment connecting (406, 188) to (226, 139).
; PLAN: r0=406(x1), r1=188(y1), r2=226(x2), r3=139(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 188
LDI r2, 226
LDI r3, 139
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
