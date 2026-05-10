; DESCRIPTION: Composite: Creates a green circular shape at (339, 172) with radius 12 then Renders a black line between points (379, 140) and (128, 144) then Renders a blue box of size 62x53 starting at (273, 49).
; PLAN: r0=339(x), r1=172(y), r2=12(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=379(x1), r6=140(y1), r7=128(x2), r8=144(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=273(x), r11=49(y), r12=62(width), r13=53(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 339
LDI r1, 172
LDI r2, 12
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 379
LDI r6, 140
LDI r7, 128
LDI r8, 144
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 273
LDI r11, 49
LDI r12, 62
LDI r13, 53
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
