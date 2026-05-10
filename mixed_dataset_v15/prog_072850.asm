; DESCRIPTION: Renders a yellow line between points (324, 13) and (71, 118).
; PLAN: r0=324(x1), r1=13(y1), r2=71(x2), r3=118(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 13
LDI r2, 71
LDI r3, 118
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
