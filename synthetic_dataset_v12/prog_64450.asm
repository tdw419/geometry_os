; DESCRIPTION: Draws a black line from (52, 199) to (323, 53).
; PLAN: r0=52(x1), r1=199(y1), r2=323(x2), r3=53(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 52
LDI r1, 199
LDI r2, 323
LDI r3, 53
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
