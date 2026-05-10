; DESCRIPTION: Renders a purple line between points (244, 210) and (241, 122).
; PLAN: r0=244(x1), r1=210(y1), r2=241(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 210
LDI r2, 241
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
