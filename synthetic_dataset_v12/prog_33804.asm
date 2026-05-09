; DESCRIPTION: Draws a yellow line from (266, 43) to (107, 131).
; PLAN: r0=266(x1), r1=43(y1), r2=107(x2), r3=131(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 266
LDI r1, 43
LDI r2, 107
LDI r3, 131
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
