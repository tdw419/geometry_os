; DESCRIPTION: Composite: Places a orange circle of radius 32 at center (263, 100) then Renders a yellow line between points (60, 15) and (442, 222) then Creates a white rectangular region at (382, 147) spanning 78 by 93 pixels.
; PLAN: r0=263(x), r1=100(y), r2=32(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=15(y1), r7=442(x2), r8=222(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=382(x), r11=147(y), r12=78(width), r13=93(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 263
LDI r1, 100
LDI r2, 32
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 15
LDI r7, 442
LDI r8, 222
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
LDI r10, 382
LDI r11, 147
LDI r12, 78
LDI r13, 93
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
