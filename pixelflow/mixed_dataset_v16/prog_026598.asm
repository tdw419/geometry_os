; DESCRIPTION: Draws a black line from (353, 100) to (110, 49).
; PLAN: r0=353(x1), r1=100(y1), r2=110(x2), r3=49(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 100
LDI r2, 110
LDI r3, 49
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
