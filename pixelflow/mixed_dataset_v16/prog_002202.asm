; DESCRIPTION: Renders a green line between points (303, 210) and (155, 147).
; PLAN: r0=303(x1), r1=210(y1), r2=155(x2), r3=147(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 303
LDI r1, 210
LDI r2, 155
LDI r3, 147
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
