; DESCRIPTION: Renders a yellow line segment connecting (195, 102) to (253, 190).
; PLAN: r0=195(x1), r1=102(y1), r2=253(x2), r3=190(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 102
LDI r2, 253
LDI r3, 190
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
HALT
