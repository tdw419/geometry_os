; DESCRIPTION: Places a black line segment connecting (122, 40) to (178, 19).
; PLAN: r0=122(x1), r1=40(y1), r2=178(x2), r3=19(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 40
LDI r2, 178
LDI r3, 19
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
