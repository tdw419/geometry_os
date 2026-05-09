; DESCRIPTION: Composite: Draws a red rectangle at (190, 182) with width 54 and height 42 then Creates a white circular shape at (129, 105) with radius 33 then Sets a single purple pixel at (315, 17).
; PLAN: r0=190(x), r1=182(y), r2=54(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=129(x), r6=105(y), r7=33(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=315(x), r11=17(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 190
LDI r1, 182
LDI r2, 54
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 129
LDI r6, 105
LDI r7, 33
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 315
LDI r11, 17
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
