; DESCRIPTION: Composite: Places a black dot at position (142, 146) then Creates a magenta circular shape at (97, 73) with radius 62 then Creates a yellow rectangular region at (268, 30) spanning 46 by 62 pixels.
; PLAN: r0=142(x), r1=146(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=97(x), r6=73(y), r7=62(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=268(x), r11=30(y), r12=46(width), r13=62(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 142
LDI r1, 146
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 97
LDI r6, 73
LDI r7, 62
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 268
LDI r11, 30
LDI r12, 46
LDI r13, 62
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
