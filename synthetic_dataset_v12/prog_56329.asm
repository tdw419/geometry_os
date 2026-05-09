; DESCRIPTION: Renders a white line between points (471, 43) and (457, 2).
; PLAN: r0=471(x1), r1=43(y1), r2=457(x2), r3=2(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 43
LDI r2, 457
LDI r3, 2
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
