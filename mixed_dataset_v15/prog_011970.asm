; DESCRIPTION: Renders a black line between points (43, 0) and (115, 122).
; PLAN: r0=43(x1), r1=0(y1), r2=115(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 43
LDI r1, 0
LDI r2, 115
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
