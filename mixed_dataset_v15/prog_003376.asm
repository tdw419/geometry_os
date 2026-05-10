; DESCRIPTION: Draws a yellow line from (71, 49) to (318, 159).
; PLAN: r0=71(x1), r1=49(y1), r2=318(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 71
LDI r1, 49
LDI r2, 318
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
