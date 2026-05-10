; DESCRIPTION: Places a black line segment connecting (472, 37) to (273, 4).
; PLAN: r0=472(x1), r1=37(y1), r2=273(x2), r3=4(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 472
LDI r1, 37
LDI r2, 273
LDI r3, 4
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
