; DESCRIPTION: Draws a black line from (241, 81) to (61, 232).
; PLAN: r0=241(x1), r1=81(y1), r2=61(x2), r3=232(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 81
LDI r2, 61
LDI r3, 232
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
