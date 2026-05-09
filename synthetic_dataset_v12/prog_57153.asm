; DESCRIPTION: Composite: Creates a white rectangular region at (379, 102) spanning 117 by 99 pixels then Draws a white circle centered at (405, 144) with radius 73.
; PLAN: r0=379(x), r1=102(y), r2=117(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=405(x), r6=144(y), r7=73(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 379
LDI r1, 102
LDI r2, 117
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 405
LDI r6, 144
LDI r7, 73
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
