; DESCRIPTION: Renders a purple line between points (467, 21) and (285, 17).
; PLAN: r0=467(x1), r1=21(y1), r2=285(x2), r3=17(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 467
LDI r1, 21
LDI r2, 285
LDI r3, 17
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
