; DESCRIPTION: Renders a black line between points (172, 65) and (183, 211).
; PLAN: r0=172(x1), r1=65(y1), r2=183(x2), r3=211(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 65
LDI r2, 183
LDI r3, 211
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
HALT
