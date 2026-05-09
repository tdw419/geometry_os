; DESCRIPTION: Renders a purple line between points (148, 222) and (300, 190).
; PLAN: r0=148(x1), r1=222(y1), r2=300(x2), r3=190(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 148
LDI r1, 222
LDI r2, 300
LDI r3, 190
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
