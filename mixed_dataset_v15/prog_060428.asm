; DESCRIPTION: Composite: Creates a magenta rectangular region at (364, 12) spanning 52 by 88 pixels then Creates a white circular shape at (203, 181) with radius 55 then Places a cyan dot at position (337, 93).
; PLAN: r0=364(x), r1=12(y), r2=52(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=203(x), r6=181(y), r7=55(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=337(x), r11=93(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 364
LDI r1, 12
LDI r2, 52
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 203
LDI r6, 181
LDI r7, 55
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 337
LDI r11, 93
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
