; DESCRIPTION: Renders a black line between points (93, 61) and (227, 132).
; PLAN: r0=93(x1), r1=61(y1), r2=227(x2), r3=132(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 61
LDI r2, 227
LDI r3, 132
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
