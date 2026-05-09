; DESCRIPTION: Renders a purple line between points (238, 43) and (157, 223).
; PLAN: r0=238(x1), r1=43(y1), r2=157(x2), r3=223(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 238
LDI r1, 43
LDI r2, 157
LDI r3, 223
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
