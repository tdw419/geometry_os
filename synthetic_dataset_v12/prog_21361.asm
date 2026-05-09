; DESCRIPTION: Draws a black line from (119, 120) to (133, 232).
; PLAN: r0=119(x1), r1=120(y1), r2=133(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 120
LDI r2, 133
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
