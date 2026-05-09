; DESCRIPTION: Renders a red line between points (11, 24) and (97, 230).
; PLAN: r0=11(x1), r1=24(y1), r2=97(x2), r3=230(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 11
LDI r1, 24
LDI r2, 97
LDI r3, 230
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
