; DESCRIPTION: Renders a purple line between points (373, 175) and (454, 179).
; PLAN: r0=373(x1), r1=175(y1), r2=454(x2), r3=179(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 175
LDI r2, 454
LDI r3, 179
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
