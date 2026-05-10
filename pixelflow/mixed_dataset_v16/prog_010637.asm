; DESCRIPTION: Places a black line segment connecting (86, 46) to (355, 82).
; PLAN: r0=86(x1), r1=46(y1), r2=355(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 46
LDI r2, 355
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
