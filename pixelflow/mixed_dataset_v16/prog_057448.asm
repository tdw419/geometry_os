; DESCRIPTION: Places a black line segment connecting (326, 90) to (216, 141).
; PLAN: r0=326(x1), r1=90(y1), r2=216(x2), r3=141(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 326
LDI r1, 90
LDI r2, 216
LDI r3, 141
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
