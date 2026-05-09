; DESCRIPTION: Renders a purple line between points (157, 98) and (80, 167).
; PLAN: r0=157(x1), r1=98(y1), r2=80(x2), r3=167(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 98
LDI r2, 80
LDI r3, 167
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
