; DESCRIPTION: Composite: Places a purple dot at position (245, 92) then Places a white circle of radius 37 at center (444, 158) then Creates a green rectangular region at (77, 171) spanning 74 by 22 pixels.
; PLAN: r0=245(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=444(x), r6=158(y), r7=37(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=77(x), r11=171(y), r12=74(width), r13=22(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 245
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 444
LDI r6, 158
LDI r7, 37
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 77
LDI r11, 171
LDI r12, 74
LDI r13, 22
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
