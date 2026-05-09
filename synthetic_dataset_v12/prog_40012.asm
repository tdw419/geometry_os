; DESCRIPTION: Renders a red line between points (358, 232) and (230, 157).
; PLAN: r0=358(x1), r1=232(y1), r2=230(x2), r3=157(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 232
LDI r2, 230
LDI r3, 157
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
HALT
