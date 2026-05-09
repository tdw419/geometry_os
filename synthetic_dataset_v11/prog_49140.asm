; DESCRIPTION: Renders a black line between points (89, 43) and (76, 190).
; PLAN: r0=89(x1), r1=43(y1), r2=76(x2), r3=190(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 43
LDI r2, 76
LDI r3, 190
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
