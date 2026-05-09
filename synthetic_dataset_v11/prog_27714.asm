; DESCRIPTION: Renders a purple line between points (148, 17) and (24, 236).
; PLAN: r0=148(x1), r1=17(y1), r2=24(x2), r3=236(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 17
LDI r2, 24
LDI r3, 236
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
