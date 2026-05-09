; DESCRIPTION: Draws a yellow line from (30, 11) to (223, 232).
; PLAN: r0=30(x1), r1=11(y1), r2=223(x2), r3=232(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 30
LDI r1, 11
LDI r2, 223
LDI r3, 232
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
