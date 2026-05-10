; DESCRIPTION: Composite: Renders a yellow disk with center (35, 122) and radius 35 then Sets a single orange pixel at (179, 31) then Draws a purple rectangle at (154, 62) with width 17 and height 53.
; PLAN: r0=35(x), r1=122(y), r2=35(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=179(x), r6=31(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=154(x), r11=62(y), r12=17(width), r13=53(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 35
LDI r1, 122
LDI r2, 35
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 179
LDI r6, 31
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 154
LDI r11, 62
LDI r12, 17
LDI r13, 53
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
