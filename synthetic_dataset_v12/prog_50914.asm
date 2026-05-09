; DESCRIPTION: Composite: Places a green dot at position (76, 175) then Renders a black disk with center (274, 104) and radius 26 then Creates a magenta rectangular region at (15, 61) spanning 90 by 110 pixels.
; PLAN: r0=76(x), r1=175(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=274(x), r6=104(y), r7=26(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=15(x), r11=61(y), r12=90(width), r13=110(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 175
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 274
LDI r6, 104
LDI r7, 26
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 15
LDI r11, 61
LDI r12, 90
LDI r13, 110
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
