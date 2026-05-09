; DESCRIPTION: Renders a yellow line between points (191, 155) and (57, 161).
; PLAN: r0=191(x1), r1=155(y1), r2=57(x2), r3=161(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 155
LDI r2, 57
LDI r3, 161
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
