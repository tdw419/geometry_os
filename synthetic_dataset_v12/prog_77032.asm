; DESCRIPTION: Renders a green line between points (274, 57) and (471, 43).
; PLAN: r0=274(x1), r1=57(y1), r2=471(x2), r3=43(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 57
LDI r2, 471
LDI r3, 43
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
