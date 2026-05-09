; DESCRIPTION: Renders a purple line between points (319, 66) and (285, 99).
; PLAN: r0=319(x1), r1=66(y1), r2=285(x2), r3=99(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 66
LDI r2, 285
LDI r3, 99
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
