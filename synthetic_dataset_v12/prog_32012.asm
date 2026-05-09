; DESCRIPTION: Places a black line segment connecting (28, 43) to (385, 11).
; PLAN: r0=28(x1), r1=43(y1), r2=385(x2), r3=11(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 28
LDI r1, 43
LDI r2, 385
LDI r3, 11
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
