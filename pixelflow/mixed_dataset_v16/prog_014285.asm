; DESCRIPTION: Places a black line segment connecting (216, 176) to (58, 71).
; PLAN: r0=216(x1), r1=176(y1), r2=58(x2), r3=71(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 216
LDI r1, 176
LDI r2, 58
LDI r3, 71
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
