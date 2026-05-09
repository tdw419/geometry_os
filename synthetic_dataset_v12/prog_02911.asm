; DESCRIPTION: Renders a black line between points (85, 51) and (26, 76).
; PLAN: r0=85(x1), r1=51(y1), r2=26(x2), r3=76(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 51
LDI r2, 26
LDI r3, 76
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
