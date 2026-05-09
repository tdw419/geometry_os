; DESCRIPTION: Composite: Renders a blue disk with center (281, 154) and radius 22 then Draws a white rectangle at (381, 171) with width 90 and height 64 then Places a yellow line segment connecting (224, 105) to (325, 227).
; PLAN: r0=281(x), r1=154(y), r2=22(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=381(x), r6=171(y), r7=90(width), r8=64(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=224(x1), r11=105(y1), r12=325(x2), r13=227(y2), r14=0xFFFF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 281
LDI r1, 154
LDI r2, 22
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 381
LDI r6, 171
LDI r7, 90
LDI r8, 64
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 224
LDI r11, 105
LDI r12, 325
LDI r13, 227
LDI r14, 0xFFFF00
LINE r10, r11, r12, r13, r14
HALT
