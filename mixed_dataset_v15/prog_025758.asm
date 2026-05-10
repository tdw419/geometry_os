; DESCRIPTION: Composite: Places a blue dot at position (340, 18) then Draws a magenta circle centered at (235, 112) with radius 74 then Creates a black rectangular region at (43, 3) spanning 116 by 31 pixels.
; PLAN: r0=340(x), r1=18(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=235(x), r6=112(y), r7=74(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=43(x), r11=3(y), r12=116(width), r13=31(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 340
LDI r1, 18
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 235
LDI r6, 112
LDI r7, 74
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 43
LDI r11, 3
LDI r12, 116
LDI r13, 31
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
