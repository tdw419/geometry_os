; DESCRIPTION: Composite: Sets a single white pixel at (253, 88) then Places a green circle of radius 24 at center (221, 92) then Creates a magenta rectangular region at (341, 37) spanning 62 by 25 pixels.
; PLAN: r0=253(x), r1=88(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=221(x), r6=92(y), r7=24(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=341(x), r11=37(y), r12=62(width), r13=25(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 253
LDI r1, 88
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 221
LDI r6, 92
LDI r7, 24
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 341
LDI r11, 37
LDI r12, 62
LDI r13, 25
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
