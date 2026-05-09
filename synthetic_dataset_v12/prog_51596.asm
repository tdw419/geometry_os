; DESCRIPTION: Renders a purple line between points (285, 36) and (166, 94).
; PLAN: r0=285(x1), r1=36(y1), r2=166(x2), r3=94(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 36
LDI r2, 166
LDI r3, 94
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
