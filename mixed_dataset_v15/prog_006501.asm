; DESCRIPTION: Draws a black line from (424, 132) to (110, 201).
; PLAN: r0=424(x1), r1=132(y1), r2=110(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 132
LDI r2, 110
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
