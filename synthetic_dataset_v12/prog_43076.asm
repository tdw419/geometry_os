; DESCRIPTION: Renders a green line between points (478, 185) and (381, 178).
; PLAN: r0=478(x1), r1=185(y1), r2=381(x2), r3=178(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 478
LDI r1, 185
LDI r2, 381
LDI r3, 178
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
HALT
