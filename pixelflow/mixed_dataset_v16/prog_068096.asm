; DESCRIPTION: Composite: Creates a red rectangular region at (240, 83) spanning 50 by 17 pixels then Draws a magenta circle centered at (197, 33) with radius 30 then Places a purple dot at position (363, 148).
; PLAN: r0=240(x), r1=83(y), r2=50(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=197(x), r6=33(y), r7=30(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=363(x), r11=148(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 83
LDI r2, 50
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 197
LDI r6, 33
LDI r7, 30
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 363
LDI r11, 148
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
