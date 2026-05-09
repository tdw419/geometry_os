; DESCRIPTION: Composite: Places a black dot at position (316, 88) then Creates a blue circular shape at (422, 109) with radius 48 then Creates a purple rectangular region at (116, 171) spanning 42 by 85 pixels.
; PLAN: r0=316(x), r1=88(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=109(y), r7=48(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=116(x), r11=171(y), r12=42(width), r13=85(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 88
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 422
LDI r6, 109
LDI r7, 48
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 116
LDI r11, 171
LDI r12, 42
LDI r13, 85
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
