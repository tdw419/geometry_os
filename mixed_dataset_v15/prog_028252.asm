; DESCRIPTION: Composite: Places a white dot at position (486, 233) then Creates a white circular shape at (176, 101) with radius 67 then Creates a yellow rectangular region at (104, 79) spanning 71 by 102 pixels.
; PLAN: r0=486(x), r1=233(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=176(x), r6=101(y), r7=67(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=104(x), r11=79(y), r12=71(width), r13=102(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 486
LDI r1, 233
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 176
LDI r6, 101
LDI r7, 67
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 104
LDI r11, 79
LDI r12, 71
LDI r13, 102
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
