; DESCRIPTION: Renders a purple line between points (217, 224) and (32, 181).
; PLAN: r0=217(x1), r1=224(y1), r2=32(x2), r3=181(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 224
LDI r2, 32
LDI r3, 181
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
