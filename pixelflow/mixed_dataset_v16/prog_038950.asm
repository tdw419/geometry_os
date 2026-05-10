; DESCRIPTION: Composite: Draws a yellow rectangle at (267, 73) with width 30 and height 116 then Draws a purple circle centered at (383, 160) with radius 61 then Sets a single black pixel at (141, 195).
; PLAN: r0=267(x), r1=73(y), r2=30(width), r3=116(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=383(x), r6=160(y), r7=61(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=141(x), r11=195(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 267
LDI r1, 73
LDI r2, 30
LDI r3, 116
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 383
LDI r6, 160
LDI r7, 61
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 141
LDI r11, 195
LDI r12, 0x000000
PSET r10, r11, r12
HALT
