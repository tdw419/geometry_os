; DESCRIPTION: Composite: Sets a single yellow pixel at (77, 242) then Draws a black circle centered at (463, 142) with radius 13 then Places a magenta 69x37 rectangle at position (396, 185).
; PLAN: r0=77(x), r1=242(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=463(x), r6=142(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=396(x), r11=185(y), r12=69(width), r13=37(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 77
LDI r1, 242
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 463
LDI r6, 142
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 396
LDI r11, 185
LDI r12, 69
LDI r13, 37
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
