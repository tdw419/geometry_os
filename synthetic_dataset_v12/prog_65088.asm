; DESCRIPTION: Places a black line segment connecting (35, 18) to (355, 200).
; PLAN: r0=35(x1), r1=18(y1), r2=355(x2), r3=200(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 35
LDI r1, 18
LDI r2, 355
LDI r3, 200
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
