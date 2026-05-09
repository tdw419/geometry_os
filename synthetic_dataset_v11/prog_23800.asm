; DESCRIPTION: Renders a black line between points (3, 35) and (122, 140).
; PLAN: r0=3(x1), r1=35(y1), r2=122(x2), r3=140(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 35
LDI r2, 122
LDI r3, 140
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
