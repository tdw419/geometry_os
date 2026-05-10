; DESCRIPTION: Renders a purple line between points (209, 86) and (40, 2).
; PLAN: r0=209(x1), r1=86(y1), r2=40(x2), r3=2(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 86
LDI r2, 40
LDI r3, 2
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
