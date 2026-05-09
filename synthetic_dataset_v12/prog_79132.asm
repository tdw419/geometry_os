; DESCRIPTION: Renders a black line between points (37, 158) and (191, 61).
; PLAN: r0=37(x1), r1=158(y1), r2=191(x2), r3=61(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 37
LDI r1, 158
LDI r2, 191
LDI r3, 61
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
