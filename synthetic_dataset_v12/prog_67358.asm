; DESCRIPTION: Renders a red line between points (424, 252) and (97, 24).
; PLAN: r0=424(x1), r1=252(y1), r2=97(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 424
LDI r1, 252
LDI r2, 97
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
