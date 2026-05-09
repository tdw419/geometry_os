; DESCRIPTION: Composite: Creates a white rectangular region at (171, 175) spanning 105 by 77 pixels then Renders a magenta disk with center (427, 184) and radius 69 then Sets a single white pixel at (24, 53).
; PLAN: r0=171(x), r1=175(y), r2=105(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=427(x), r6=184(y), r7=69(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=24(x), r11=53(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 175
LDI r2, 105
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 427
LDI r6, 184
LDI r7, 69
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 24
LDI r11, 53
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
