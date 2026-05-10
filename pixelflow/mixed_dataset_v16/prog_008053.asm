; DESCRIPTION: Renders a purple line between points (306, 204) and (444, 33).
; PLAN: r0=306(x1), r1=204(y1), r2=444(x2), r3=33(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 204
LDI r2, 444
LDI r3, 33
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
