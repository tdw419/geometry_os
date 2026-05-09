; DESCRIPTION: Composite: Creates a white rectangular region at (437, 56) spanning 65 by 118 pixels then Draws a blue circle centered at (412, 73) with radius 31.
; PLAN: r0=437(x), r1=56(y), r2=65(width), r3=118(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=412(x), r6=73(y), r7=31(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 437
LDI r1, 56
LDI r2, 65
LDI r3, 118
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 412
LDI r6, 73
LDI r7, 31
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
