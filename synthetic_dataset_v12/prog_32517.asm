; DESCRIPTION: Renders a purple line between points (372, 90) and (12, 36).
; PLAN: r0=372(x1), r1=90(y1), r2=12(x2), r3=36(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 90
LDI r2, 12
LDI r3, 36
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
