; DESCRIPTION: Renders a purple line between points (26, 246) and (225, 209).
; PLAN: r0=26(x1), r1=246(y1), r2=225(x2), r3=209(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 246
LDI r2, 225
LDI r3, 209
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
