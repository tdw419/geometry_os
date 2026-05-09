; DESCRIPTION: Renders a purple line between points (34, 240) and (213, 75).
; PLAN: r0=34(x1), r1=240(y1), r2=213(x2), r3=75(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 34
LDI r1, 240
LDI r2, 213
LDI r3, 75
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
