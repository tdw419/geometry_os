; DESCRIPTION: Composite: Draws a black circle centered at (236, 149) with radius 73 then Creates a purple rectangular region at (274, 25) spanning 88 by 17 pixels then Sets a single orange pixel at (124, 95).
; PLAN: r0=236(x), r1=149(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=274(x), r6=25(y), r7=88(width), r8=17(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=124(x), r11=95(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 236
LDI r1, 149
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 274
LDI r6, 25
LDI r7, 88
LDI r8, 17
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 124
LDI r11, 95
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
