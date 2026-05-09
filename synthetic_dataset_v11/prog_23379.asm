; DESCRIPTION: Renders a black line between points (142, 180) and (81, 145).
; PLAN: r0=142(x1), r1=180(y1), r2=81(x2), r3=145(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 180
LDI r2, 81
LDI r3, 145
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
