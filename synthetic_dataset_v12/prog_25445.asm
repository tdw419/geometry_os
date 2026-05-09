; DESCRIPTION: Renders a green line between points (322, 130) and (451, 217).
; PLAN: r0=322(x1), r1=130(y1), r2=451(x2), r3=217(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 130
LDI r2, 451
LDI r3, 217
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
