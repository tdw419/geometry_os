; DESCRIPTION: Renders a yellow line between points (426, 35) and (381, 159).
; PLAN: r0=426(x1), r1=35(y1), r2=381(x2), r3=159(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 35
LDI r2, 381
LDI r3, 159
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
