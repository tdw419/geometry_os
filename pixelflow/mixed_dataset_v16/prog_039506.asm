; DESCRIPTION: Renders a green line between points (163, 230) and (396, 202).
; PLAN: r0=163(x1), r1=230(y1), r2=396(x2), r3=202(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 230
LDI r2, 396
LDI r3, 202
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
