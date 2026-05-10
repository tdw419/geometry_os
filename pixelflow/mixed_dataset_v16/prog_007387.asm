; DESCRIPTION: Composite: Draws a cyan rectangle at (268, 118) with width 115 and height 100 then Draws a purple circle centered at (385, 175) with radius 72 then Sets a single purple pixel at (274, 223).
; PLAN: r0=268(x), r1=118(y), r2=115(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=385(x), r6=175(y), r7=72(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=274(x), r11=223(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 268
LDI r1, 118
LDI r2, 115
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 385
LDI r6, 175
LDI r7, 72
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 274
LDI r11, 223
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
