; DESCRIPTION: Renders a purple line between points (204, 206) and (21, 197).
; PLAN: r0=204(x1), r1=206(y1), r2=21(x2), r3=197(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 206
LDI r2, 21
LDI r3, 197
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
