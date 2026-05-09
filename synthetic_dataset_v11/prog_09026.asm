; DESCRIPTION: Renders a purple line between points (167, 160) and (4, 157).
; PLAN: r0=167(x1), r1=160(y1), r2=4(x2), r3=157(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 160
LDI r2, 4
LDI r3, 157
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
