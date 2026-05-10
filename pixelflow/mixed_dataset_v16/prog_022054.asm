; DESCRIPTION: Composite: Draws a blue rectangle at (31, 64) with width 17 and height 100 then Draws a white line from (246, 114) to (52, 224) then Creates a red circular shape at (280, 123) with radius 43.
; PLAN: r0=31(x), r1=64(y), r2=17(width), r3=100(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=246(x1), r6=114(y1), r7=52(x2), r8=224(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=280(x), r11=123(y), r12=43(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 31
LDI r1, 64
LDI r2, 17
LDI r3, 100
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 246
LDI r6, 114
LDI r7, 52
LDI r8, 224
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
LDI r10, 280
LDI r11, 123
LDI r12, 43
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
