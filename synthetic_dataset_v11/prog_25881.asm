; DESCRIPTION: Places a purple line segment connecting (19, 176) to (149, 242).
; PLAN: r0=19(x1), r1=176(y1), r2=149(x2), r3=242(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 176
LDI r2, 149
LDI r3, 242
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
