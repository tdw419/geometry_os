; DESCRIPTION: Composite: Creates a white circular shape at (441, 140) with radius 32 then Sets a single white pixel at (438, 13) then Creates a black rectangular region at (278, 102) spanning 54 by 48 pixels.
; PLAN: r0=441(x), r1=140(y), r2=32(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=438(x), r6=13(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=278(x), r11=102(y), r12=54(width), r13=48(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 441
LDI r1, 140
LDI r2, 32
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 438
LDI r6, 13
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 278
LDI r11, 102
LDI r12, 54
LDI r13, 48
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
