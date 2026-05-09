; DESCRIPTION: Renders a purple line between points (501, 192) and (310, 171).
; PLAN: r0=501(x1), r1=192(y1), r2=310(x2), r3=171(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 501
LDI r1, 192
LDI r2, 310
LDI r3, 171
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
