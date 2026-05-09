; DESCRIPTION: Renders a purple line between points (240, 30) and (372, 71).
; PLAN: r0=240(x1), r1=30(y1), r2=372(x2), r3=71(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 240
LDI r1, 30
LDI r2, 372
LDI r3, 71
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
