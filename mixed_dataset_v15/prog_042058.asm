; DESCRIPTION: Composite: Sets a single green pixel at (345, 183) then Creates a purple circular shape at (380, 227) with radius 23 then Creates a purple rectangular region at (192, 2) spanning 110 by 67 pixels.
; PLAN: r0=345(x), r1=183(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=227(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=192(x), r11=2(y), r12=110(width), r13=67(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 345
LDI r1, 183
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 380
LDI r6, 227
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 192
LDI r11, 2
LDI r12, 110
LDI r13, 67
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
