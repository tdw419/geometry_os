; DESCRIPTION: Draws a black line from (324, 82) to (170, 227).
; PLAN: r0=324(x1), r1=82(y1), r2=170(x2), r3=227(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 82
LDI r2, 170
LDI r3, 227
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
