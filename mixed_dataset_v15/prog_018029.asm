; DESCRIPTION: Composite: Creates a black circular shape at (137, 142) with radius 29 then Creates a yellow rectangular region at (34, 156) spanning 85 by 24 pixels then Places a magenta dot at position (373, 179).
; PLAN: r0=137(x), r1=142(y), r2=29(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=34(x), r6=156(y), r7=85(width), r8=24(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=373(x), r11=179(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 137
LDI r1, 142
LDI r2, 29
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 34
LDI r6, 156
LDI r7, 85
LDI r8, 24
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 179
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
