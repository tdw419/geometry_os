; DESCRIPTION: Renders a purple line between points (481, 251) and (419, 255).
; PLAN: r0=481(x1), r1=251(y1), r2=419(x2), r3=255(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 481
LDI r1, 251
LDI r2, 419
LDI r3, 255
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
