; DESCRIPTION: Draws a black line from (172, 155) to (133, 61).
; PLAN: r0=172(x1), r1=155(y1), r2=133(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 155
LDI r2, 133
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
