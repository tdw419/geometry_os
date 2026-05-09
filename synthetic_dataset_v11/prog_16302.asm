; DESCRIPTION: Renders a green line between points (191, 198) and (155, 223).
; PLAN: r0=191(x1), r1=198(y1), r2=155(x2), r3=223(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 198
LDI r2, 155
LDI r3, 223
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
