; DESCRIPTION: Renders a purple line between points (171, 197) and (204, 147).
; PLAN: r0=171(x1), r1=197(y1), r2=204(x2), r3=147(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 197
LDI r2, 204
LDI r3, 147
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
