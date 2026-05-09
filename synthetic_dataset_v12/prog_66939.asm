; DESCRIPTION: Composite: Places a white dot at position (380, 42) then Draws a green circle centered at (184, 143) with radius 66 then Creates a black rectangular region at (414, 165) spanning 87 by 28 pixels.
; PLAN: r0=380(x), r1=42(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=184(x), r6=143(y), r7=66(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=414(x), r11=165(y), r12=87(width), r13=28(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 380
LDI r1, 42
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 184
LDI r6, 143
LDI r7, 66
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 414
LDI r11, 165
LDI r12, 87
LDI r13, 28
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
