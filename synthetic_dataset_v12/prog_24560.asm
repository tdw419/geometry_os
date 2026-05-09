; DESCRIPTION: Places a black line segment connecting (230, 26) to (403, 119).
; PLAN: r0=230(x1), r1=26(y1), r2=403(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 26
LDI r2, 403
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
