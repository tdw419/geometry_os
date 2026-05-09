; DESCRIPTION: Renders a purple line between points (78, 63) and (213, 90).
; PLAN: r0=78(x1), r1=63(y1), r2=213(x2), r3=90(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 63
LDI r2, 213
LDI r3, 90
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
