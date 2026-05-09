; DESCRIPTION: Renders a purple line between points (183, 110) and (272, 161).
; PLAN: r0=183(x1), r1=110(y1), r2=272(x2), r3=161(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 110
LDI r2, 272
LDI r3, 161
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
