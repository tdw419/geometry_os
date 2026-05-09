; DESCRIPTION: Composite: Draws a blue circle centered at (190, 158) with radius 52 then Draws a purple line from (0, 101) to (48, 74) then Creates a white rectangular region at (425, 31) spanning 10 by 63 pixels.
; PLAN: r0=190(x), r1=158(y), r2=52(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=0(x1), r6=101(y1), r7=48(x2), r8=74(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=425(x), r11=31(y), r12=10(width), r13=63(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 190
LDI r1, 158
LDI r2, 52
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 0
LDI r6, 101
LDI r7, 48
LDI r8, 74
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 425
LDI r11, 31
LDI r12, 10
LDI r13, 63
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
