; DESCRIPTION: Renders a purple line between points (486, 15) and (184, 23).
; PLAN: r0=486(x1), r1=15(y1), r2=184(x2), r3=23(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 486
LDI r1, 15
LDI r2, 184
LDI r3, 23
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
