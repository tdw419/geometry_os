; DESCRIPTION: Draws a black line from (380, 145) to (15, 232).
; PLAN: r0=380(x1), r1=145(y1), r2=15(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 145
LDI r2, 15
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
