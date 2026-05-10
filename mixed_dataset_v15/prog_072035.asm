; DESCRIPTION: Renders a purple line between points (323, 221) and (244, 232).
; PLAN: r0=323(x1), r1=221(y1), r2=244(x2), r3=232(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 221
LDI r2, 244
LDI r3, 232
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
