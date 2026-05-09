; DESCRIPTION: Places a black line segment connecting (97, 94) to (135, 100).
; PLAN: r0=97(x1), r1=94(y1), r2=135(x2), r3=100(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 97
LDI r1, 94
LDI r2, 135
LDI r3, 100
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
