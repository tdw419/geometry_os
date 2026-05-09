; DESCRIPTION: Draws a black line from (265, 35) to (250, 201).
; PLAN: r0=265(x1), r1=35(y1), r2=250(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 35
LDI r2, 250
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
