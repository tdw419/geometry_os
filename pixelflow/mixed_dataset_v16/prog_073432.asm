; DESCRIPTION: Composite: Renders a purple line between points (440, 63) and (144, 65) then Creates a purple circular shape at (261, 116) with radius 65.
; PLAN: r0=440(x1), r1=63(y1), r2=144(x2), r3=65(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=261(x), r6=116(y), r7=65(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 440
LDI r1, 63
LDI r2, 144
LDI r3, 65
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 261
LDI r6, 116
LDI r7, 65
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
