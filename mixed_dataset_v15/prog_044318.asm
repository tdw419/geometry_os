; DESCRIPTION: Composite: Draws a black rectangle at (16, 73) with width 64 and height 12 then Creates a black circular shape at (217, 37) with radius 16 then Renders a white line between points (457, 121) and (252, 32).
; PLAN: r0=16(x), r1=73(y), r2=64(width), r3=12(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=217(x), r6=37(y), r7=16(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=457(x1), r11=121(y1), r12=252(x2), r13=32(y2), r14=0xFFFFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 16
LDI r1, 73
LDI r2, 64
LDI r3, 12
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 217
LDI r6, 37
LDI r7, 16
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 457
LDI r11, 121
LDI r12, 252
LDI r13, 32
LDI r14, 0xFFFFFF
LINE r10, r11, r12, r13, r14
HALT
