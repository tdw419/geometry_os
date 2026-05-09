; DESCRIPTION: Composite: Creates a white rectangular region at (213, 145) spanning 105 by 26 pixels then Draws a blue circle centered at (263, 110) with radius 42.
; PLAN: r0=213(x), r1=145(y), r2=105(width), r3=26(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=263(x), r6=110(y), r7=42(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 213
LDI r1, 145
LDI r2, 105
LDI r3, 26
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 263
LDI r6, 110
LDI r7, 42
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
HALT
