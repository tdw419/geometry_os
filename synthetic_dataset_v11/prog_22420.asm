; DESCRIPTION: Places a black line segment connecting (216, 74) to (192, 254).
; PLAN: r0=216(x1), r1=74(y1), r2=192(x2), r3=254(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 74
LDI r2, 192
LDI r3, 254
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
