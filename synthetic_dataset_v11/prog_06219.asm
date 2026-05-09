; DESCRIPTION: Places a black line segment connecting (93, 2) to (251, 46).
; PLAN: r0=93(x1), r1=2(y1), r2=251(x2), r3=46(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 2
LDI r2, 251
LDI r3, 46
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
