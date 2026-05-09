; DESCRIPTION: Renders a purple line between points (274, 125) and (438, 225).
; PLAN: r0=274(x1), r1=125(y1), r2=438(x2), r3=225(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 125
LDI r2, 438
LDI r3, 225
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
