; DESCRIPTION: Composite: Creates a green rectangular region at (147, 143) spanning 82 by 108 pixels then Places a magenta dot at position (376, 175) then Places a blue circle of radius 79 at center (415, 101).
; PLAN: r0=147(x), r1=143(y), r2=82(width), r3=108(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=376(x), r6=175(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=415(x), r11=101(y), r12=79(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 147
LDI r1, 143
LDI r2, 82
LDI r3, 108
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 376
LDI r6, 175
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 415
LDI r11, 101
LDI r12, 79
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
