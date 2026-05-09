; DESCRIPTION: Renders a black line between points (64, 158) and (118, 115).
; PLAN: r0=64(x1), r1=158(y1), r2=118(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 158
LDI r2, 118
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
