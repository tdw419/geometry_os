; DESCRIPTION: Places a black line segment connecting (466, 43) to (501, 115).
; PLAN: r0=466(x1), r1=43(y1), r2=501(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 466
LDI r1, 43
LDI r2, 501
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
