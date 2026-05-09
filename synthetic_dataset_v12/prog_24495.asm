; DESCRIPTION: Renders a black line between points (119, 36) and (489, 157).
; PLAN: r0=119(x1), r1=36(y1), r2=489(x2), r3=157(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 36
LDI r2, 489
LDI r3, 157
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
