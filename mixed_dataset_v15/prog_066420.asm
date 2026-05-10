; DESCRIPTION: Renders a white line between points (94, 212) and (471, 130).
; PLAN: r0=94(x1), r1=212(y1), r2=471(x2), r3=130(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 212
LDI r2, 471
LDI r3, 130
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
HALT
