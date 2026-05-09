; DESCRIPTION: Renders a white line between points (247, 43) and (232, 101).
; PLAN: r0=247(x1), r1=43(y1), r2=232(x2), r3=101(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 43
LDI r2, 232
LDI r3, 101
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
