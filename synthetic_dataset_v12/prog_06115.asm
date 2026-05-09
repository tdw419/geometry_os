; DESCRIPTION: Renders a yellow line between points (178, 251) and (118, 11).
; PLAN: r0=178(x1), r1=251(y1), r2=118(x2), r3=11(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 251
LDI r2, 118
LDI r3, 11
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
