; DESCRIPTION: Composite: Renders a white disk with center (179, 88) and radius 63 then Renders a purple line between points (105, 179) and (495, 54) then Renders a white box of size 43x65 starting at (105, 174).
; PLAN: r0=179(x), r1=88(y), r2=63(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=105(x1), r6=179(y1), r7=495(x2), r8=54(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=105(x), r11=174(y), r12=43(width), r13=65(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 179
LDI r1, 88
LDI r2, 63
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 105
LDI r6, 179
LDI r7, 495
LDI r8, 54
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 105
LDI r11, 174
LDI r12, 43
LDI r13, 65
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
