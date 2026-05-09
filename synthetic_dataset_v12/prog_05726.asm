; DESCRIPTION: Composite: Creates a purple rectangular region at (344, 17) spanning 69 by 74 pixels then Places a magenta circle of radius 19 at center (370, 163) then Places a purple dot at position (452, 251).
; PLAN: r0=344(x), r1=17(y), r2=69(width), r3=74(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=370(x), r6=163(y), r7=19(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=452(x), r11=251(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 344
LDI r1, 17
LDI r2, 69
LDI r3, 74
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 370
LDI r6, 163
LDI r7, 19
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 452
LDI r11, 251
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
