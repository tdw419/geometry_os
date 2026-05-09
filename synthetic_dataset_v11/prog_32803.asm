; DESCRIPTION: Renders a yellow line between points (89, 142) and (237, 188).
; PLAN: r0=89(x1), r1=142(y1), r2=237(x2), r3=188(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 89
LDI r1, 142
LDI r2, 237
LDI r3, 188
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
