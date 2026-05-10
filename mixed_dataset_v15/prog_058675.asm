; DESCRIPTION: Renders a black line between points (115, 157) and (389, 119).
; PLAN: r0=115(x1), r1=157(y1), r2=389(x2), r3=119(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 115
LDI r1, 157
LDI r2, 389
LDI r3, 119
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
