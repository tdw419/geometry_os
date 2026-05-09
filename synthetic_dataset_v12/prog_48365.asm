; DESCRIPTION: Renders a green line between points (396, 8) and (86, 217).
; PLAN: r0=396(x1), r1=8(y1), r2=86(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 396
LDI r1, 8
LDI r2, 86
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
