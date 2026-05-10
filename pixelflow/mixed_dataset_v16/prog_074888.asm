; DESCRIPTION: Renders a purple line between points (449, 130) and (436, 105).
; PLAN: r0=449(x1), r1=130(y1), r2=436(x2), r3=105(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 449
LDI r1, 130
LDI r2, 436
LDI r3, 105
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
