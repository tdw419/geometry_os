; DESCRIPTION: Renders a purple line between points (18, 206) and (39, 130).
; PLAN: r0=18(x1), r1=206(y1), r2=39(x2), r3=130(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 206
LDI r2, 39
LDI r3, 130
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
