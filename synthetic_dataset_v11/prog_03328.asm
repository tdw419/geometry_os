; DESCRIPTION: Renders a black line between points (25, 118) and (157, 36).
; PLAN: r0=25(x1), r1=118(y1), r2=157(x2), r3=36(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 118
LDI r2, 157
LDI r3, 36
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
