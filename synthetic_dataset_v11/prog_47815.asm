; DESCRIPTION: Renders a purple line between points (31, 33) and (209, 122).
; PLAN: r0=31(x1), r1=33(y1), r2=209(x2), r3=122(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 33
LDI r2, 209
LDI r3, 122
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
