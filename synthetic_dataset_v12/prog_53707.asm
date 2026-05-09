; DESCRIPTION: Composite: Sets a single white pixel at (190, 115) then Renders a magenta disk with center (179, 144) and radius 48 then Renders a yellow line between points (490, 136) and (375, 20).
; PLAN: r0=190(x), r1=115(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=179(x), r6=144(y), r7=48(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=490(x1), r11=136(y1), r12=375(x2), r13=20(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 115
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 179
LDI r6, 144
LDI r7, 48
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 490
LDI r11, 136
LDI r12, 375
LDI r13, 20
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
