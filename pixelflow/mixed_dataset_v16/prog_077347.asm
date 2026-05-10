; DESCRIPTION: Renders a purple line between points (183, 226) and (90, 0).
; PLAN: r0=183(x1), r1=226(y1), r2=90(x2), r3=0(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 226
LDI r2, 90
LDI r3, 0
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
