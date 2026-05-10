; DESCRIPTION: Places a blue line segment connecting (194, 126) to (271, 97).
; PLAN: r0=194(x1), r1=126(y1), r2=271(x2), r3=97(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 194
LDI r1, 126
LDI r2, 271
LDI r3, 97
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
HALT
