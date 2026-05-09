; DESCRIPTION: Draws a black line from (232, 254) to (48, 145).
; PLAN: r0=232(x1), r1=254(y1), r2=48(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 254
LDI r2, 48
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
