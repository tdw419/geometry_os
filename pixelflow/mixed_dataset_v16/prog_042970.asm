; DESCRIPTION: Composite: Renders a orange box of size 43x21 starting at (292, 109) then Creates a white circular shape at (390, 147) with radius 17 then Sets a single red pixel at (4, 63).
; PLAN: r0=292(x), r1=109(y), r2=43(width), r3=21(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=390(x), r6=147(y), r7=17(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=4(x), r11=63(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 292
LDI r1, 109
LDI r2, 43
LDI r3, 21
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 390
LDI r6, 147
LDI r7, 17
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 4
LDI r11, 63
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
