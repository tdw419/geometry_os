; DESCRIPTION: Renders a purple line between points (182, 7) and (370, 119).
; PLAN: r0=182(x1), r1=7(y1), r2=370(x2), r3=119(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 182
LDI r1, 7
LDI r2, 370
LDI r3, 119
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
