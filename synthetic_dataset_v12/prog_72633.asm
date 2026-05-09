; DESCRIPTION: Places a black line segment connecting (355, 186) to (28, 49).
; PLAN: r0=355(x1), r1=186(y1), r2=28(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 186
LDI r2, 28
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
