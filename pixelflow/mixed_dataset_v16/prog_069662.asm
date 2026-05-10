; DESCRIPTION: Places a black line segment connecting (137, 30) to (207, 122).
; PLAN: r0=137(x1), r1=30(y1), r2=207(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 30
LDI r2, 207
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
