; DESCRIPTION: Composite: Draws a magenta rectangle at (246, 175) with width 115 and height 43 then Places a purple circle of radius 55 at center (457, 82) then Sets a single magenta pixel at (452, 14).
; PLAN: r0=246(x), r1=175(y), r2=115(width), r3=43(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=457(x), r6=82(y), r7=55(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=452(x), r11=14(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 246
LDI r1, 175
LDI r2, 115
LDI r3, 43
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 457
LDI r6, 82
LDI r7, 55
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 452
LDI r11, 14
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
