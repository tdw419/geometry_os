; DESCRIPTION: Places a black line segment connecting (4, 216) to (151, 17).
; PLAN: r0=4(x1), r1=216(y1), r2=151(x2), r3=17(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 4
LDI r1, 216
LDI r2, 151
LDI r3, 17
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
