; DESCRIPTION: Draws a black line from (493, 201) to (30, 184).
; PLAN: r0=493(x1), r1=201(y1), r2=30(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 201
LDI r2, 30
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
