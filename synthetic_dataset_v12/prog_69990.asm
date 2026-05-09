; DESCRIPTION: Renders a black line between points (399, 199) and (458, 10).
; PLAN: r0=399(x1), r1=199(y1), r2=458(x2), r3=10(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 399
LDI r1, 199
LDI r2, 458
LDI r3, 10
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
