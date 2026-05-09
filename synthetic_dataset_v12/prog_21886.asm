; DESCRIPTION: Renders a green line between points (19, 4) and (155, 0).
; PLAN: r0=19(x1), r1=4(y1), r2=155(x2), r3=0(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 4
LDI r2, 155
LDI r3, 0
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
