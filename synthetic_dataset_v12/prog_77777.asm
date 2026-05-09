; DESCRIPTION: Draws a black line from (426, 134) to (158, 129).
; PLAN: r0=426(x1), r1=134(y1), r2=158(x2), r3=129(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 134
LDI r2, 158
LDI r3, 129
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
