; DESCRIPTION: Places a black line segment connecting (389, 97) to (230, 26).
; PLAN: r0=389(x1), r1=97(y1), r2=230(x2), r3=26(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 389
LDI r1, 97
LDI r2, 230
LDI r3, 26
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
