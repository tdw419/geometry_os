; DESCRIPTION: Renders a black line between points (46, 118) and (226, 122).
; PLAN: r0=46(x1), r1=118(y1), r2=226(x2), r3=122(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 118
LDI r2, 226
LDI r3, 122
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
