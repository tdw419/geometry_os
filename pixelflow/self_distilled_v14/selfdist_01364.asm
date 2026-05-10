; DESCRIPTION: Renders a purple line segment connecting (373, 42) to (364, 185).
; PLAN: r0=373(x1), r1=42(y1), r2=364(x2), r3=185(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4.
LDI r0, 373
LDI r1, 42
LDI r2, 364
LDI r3, 185
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
HALT
