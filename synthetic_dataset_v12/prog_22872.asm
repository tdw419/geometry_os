; DESCRIPTION: Places a black line segment connecting (134, 252) to (110, 18).
; PLAN: r0=134(x1), r1=252(y1), r2=110(x2), r3=18(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 252
LDI r2, 110
LDI r3, 18
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
