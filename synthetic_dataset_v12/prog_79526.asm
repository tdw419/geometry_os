; DESCRIPTION: Renders a purple line between points (50, 237) and (418, 114).
; PLAN: r0=50(x1), r1=237(y1), r2=418(x2), r3=114(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 237
LDI r2, 418
LDI r3, 114
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
