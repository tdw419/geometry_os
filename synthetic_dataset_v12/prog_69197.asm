; DESCRIPTION: Renders a purple line between points (493, 225) and (381, 255).
; PLAN: r0=493(x1), r1=225(y1), r2=381(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 493
LDI r1, 225
LDI r2, 381
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
