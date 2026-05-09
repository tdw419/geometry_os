; DESCRIPTION: Draws a black line from (201, 52) to (90, 115).
; PLAN: r0=201(x1), r1=52(y1), r2=90(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 52
LDI r2, 90
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
