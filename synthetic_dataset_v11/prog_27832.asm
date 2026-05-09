; DESCRIPTION: Renders a black line between points (45, 34) and (134, 115).
; PLAN: r0=45(x1), r1=34(y1), r2=134(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 34
LDI r2, 134
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
