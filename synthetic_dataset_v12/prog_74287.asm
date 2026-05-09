; DESCRIPTION: Renders a black line between points (66, 81) and (83, 184).
; PLAN: r0=66(x1), r1=81(y1), r2=83(x2), r3=184(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 66
LDI r1, 81
LDI r2, 83
LDI r3, 184
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
