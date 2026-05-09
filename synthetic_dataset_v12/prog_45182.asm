; DESCRIPTION: Composite: Places a purple dot at position (498, 0) then Draws a purple circle centered at (412, 104) with radius 45 then Creates a magenta rectangular region at (386, 34) spanning 101 by 12 pixels.
; PLAN: r0=498(x), r1=0(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=412(x), r6=104(y), r7=45(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=34(y), r12=101(width), r13=12(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 498
LDI r1, 0
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 412
LDI r6, 104
LDI r7, 45
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 34
LDI r12, 101
LDI r13, 12
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
