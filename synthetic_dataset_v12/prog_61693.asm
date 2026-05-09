; DESCRIPTION: Composite: Places a yellow dot at position (456, 236) then Creates a black circular shape at (353, 40) with radius 33 then Creates a yellow rectangular region at (64, 157) spanning 80 by 49 pixels.
; PLAN: r0=456(x), r1=236(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=353(x), r6=40(y), r7=33(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=64(x), r11=157(y), r12=80(width), r13=49(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 456
LDI r1, 236
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 353
LDI r6, 40
LDI r7, 33
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 64
LDI r11, 157
LDI r12, 80
LDI r13, 49
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
