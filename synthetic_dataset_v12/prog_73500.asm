; DESCRIPTION: Composite: Sets a single black pixel at (64, 204) then Creates a cyan circular shape at (37, 147) with radius 17 then Creates a orange rectangular region at (67, 15) spanning 105 by 58 pixels.
; PLAN: r0=64(x), r1=204(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=37(x), r6=147(y), r7=17(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=67(x), r11=15(y), r12=105(width), r13=58(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 64
LDI r1, 204
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 37
LDI r6, 147
LDI r7, 17
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 67
LDI r11, 15
LDI r12, 105
LDI r13, 58
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
