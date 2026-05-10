; DESCRIPTION: Renders a purple line between points (31, 204) and (268, 3).
; PLAN: r0=31(x1), r1=204(y1), r2=268(x2), r3=3(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 204
LDI r2, 268
LDI r3, 3
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
