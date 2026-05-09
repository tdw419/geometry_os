; DESCRIPTION: Composite: Places a black dot at position (418, 135) then Creates a blue rectangular region at (321, 246) spanning 56 by 10 pixels then Draws a magenta circle centered at (375, 160) with radius 24.
; PLAN: r0=418(x), r1=135(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=321(x), r6=246(y), r7=56(width), r8=10(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=375(x), r11=160(y), r12=24(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 418
LDI r1, 135
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 321
LDI r6, 246
LDI r7, 56
LDI r8, 10
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 375
LDI r11, 160
LDI r12, 24
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
