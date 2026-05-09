; DESCRIPTION: Composite: Renders a red line between points (64, 139) and (427, 254) then Creates a white circular shape at (152, 83) with radius 20 then Draws a black rectangle at (240, 63) with width 21 and height 101.
; PLAN: r0=64(x1), r1=139(y1), r2=427(x2), r3=254(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=152(x), r6=83(y), r7=20(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=240(x), r11=63(y), r12=21(width), r13=101(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 139
LDI r2, 427
LDI r3, 254
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 152
LDI r6, 83
LDI r7, 20
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 240
LDI r11, 63
LDI r12, 21
LDI r13, 101
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
