; DESCRIPTION: Composite: Draws a cyan circle centered at (68, 182) with radius 22 then Draws a purple rectangle at (312, 76) with width 88 and height 113 then Sets a single magenta pixel at (250, 225).
; PLAN: r0=68(x), r1=182(y), r2=22(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=312(x), r6=76(y), r7=88(width), r8=113(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=250(x), r11=225(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 68
LDI r1, 182
LDI r2, 22
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 312
LDI r6, 76
LDI r7, 88
LDI r8, 113
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 250
LDI r11, 225
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
