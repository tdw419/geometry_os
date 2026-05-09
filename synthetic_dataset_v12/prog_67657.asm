; DESCRIPTION: Renders a black line between points (362, 63) and (78, 201).
; PLAN: r0=362(x1), r1=63(y1), r2=78(x2), r3=201(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 63
LDI r2, 78
LDI r3, 201
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
