; DESCRIPTION: Renders a purple line between points (382, 30) and (176, 87).
; PLAN: r0=382(x1), r1=30(y1), r2=176(x2), r3=87(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 30
LDI r2, 176
LDI r3, 87
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
