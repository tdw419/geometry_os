; DESCRIPTION: Composite: Creates a orange circular shape at (318, 88) with radius 44 then Places a black dot at position (242, 48) then Creates a white rectangular region at (65, 104) spanning 99 by 39 pixels.
; PLAN: r0=318(x), r1=88(y), r2=44(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=242(x), r6=48(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=65(x), r11=104(y), r12=99(width), r13=39(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 318
LDI r1, 88
LDI r2, 44
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 242
LDI r6, 48
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 65
LDI r11, 104
LDI r12, 99
LDI r13, 39
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
