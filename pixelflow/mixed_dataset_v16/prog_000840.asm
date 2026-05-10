; DESCRIPTION: Renders a purple line between points (338, 130) and (198, 49).
; PLAN: r0=338(x1), r1=130(y1), r2=198(x2), r3=49(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 338
LDI r1, 130
LDI r2, 198
LDI r3, 49
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
