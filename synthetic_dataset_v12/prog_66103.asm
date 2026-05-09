; DESCRIPTION: Composite: Creates a magenta rectangular region at (153, 113) spanning 96 by 95 pixels then Places a cyan circle of radius 62 at center (157, 156) then Sets a single cyan pixel at (203, 0).
; PLAN: r0=153(x), r1=113(y), r2=96(width), r3=95(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=157(x), r6=156(y), r7=62(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=0(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 153
LDI r1, 113
LDI r2, 96
LDI r3, 95
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 157
LDI r6, 156
LDI r7, 62
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 0
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
