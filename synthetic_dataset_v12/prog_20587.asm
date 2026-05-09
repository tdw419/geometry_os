; DESCRIPTION: Places a black line segment connecting (438, 69) to (216, 18).
; PLAN: r0=438(x1), r1=69(y1), r2=216(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 438
LDI r1, 69
LDI r2, 216
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
