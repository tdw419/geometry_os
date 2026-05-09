; DESCRIPTION: Renders a purple line between points (29, 62) and (204, 231).
; PLAN: r0=29(x1), r1=62(y1), r2=204(x2), r3=231(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 62
LDI r2, 204
LDI r3, 231
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
