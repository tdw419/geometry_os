; DESCRIPTION: Renders a purple line between points (214, 199) and (238, 52).
; PLAN: r0=214(x1), r1=199(y1), r2=238(x2), r3=52(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 199
LDI r2, 238
LDI r3, 52
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
