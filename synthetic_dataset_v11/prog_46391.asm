; DESCRIPTION: Renders a black line between points (83, 51) and (149, 5).
; PLAN: r0=83(x1), r1=51(y1), r2=149(x2), r3=5(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 51
LDI r2, 149
LDI r3, 5
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
