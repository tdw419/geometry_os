; DESCRIPTION: Renders a black line between points (211, 197) and (118, 62).
; PLAN: r0=211(x1), r1=197(y1), r2=118(x2), r3=62(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 197
LDI r2, 118
LDI r3, 62
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
