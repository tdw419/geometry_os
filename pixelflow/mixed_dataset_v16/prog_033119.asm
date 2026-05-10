; DESCRIPTION: Composite: Creates a cyan rectangular region at (43, 125) spanning 41 by 16 pixels then Draws a purple circle centered at (291, 151) with radius 49.
; PLAN: r0=43(x), r1=125(y), r2=41(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=291(x), r6=151(y), r7=49(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 43
LDI r1, 125
LDI r2, 41
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 291
LDI r6, 151
LDI r7, 49
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
