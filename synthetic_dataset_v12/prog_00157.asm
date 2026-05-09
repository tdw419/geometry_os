; DESCRIPTION: Renders a black line between points (294, 189) and (159, 72).
; PLAN: r0=294(x1), r1=189(y1), r2=159(x2), r3=72(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 189
LDI r2, 159
LDI r3, 72
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
