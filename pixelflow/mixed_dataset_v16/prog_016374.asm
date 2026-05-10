; DESCRIPTION: Composite: Creates a red rectangular region at (355, 97) spanning 66 by 18 pixels then Draws a blue circle centered at (165, 173) with radius 80 then Places a white dot at position (145, 205).
; PLAN: r0=355(x), r1=97(y), r2=66(width), r3=18(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=165(x), r6=173(y), r7=80(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=145(x), r11=205(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 355
LDI r1, 97
LDI r2, 66
LDI r3, 18
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 165
LDI r6, 173
LDI r7, 80
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 145
LDI r11, 205
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
