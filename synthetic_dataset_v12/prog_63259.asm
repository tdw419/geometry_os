; DESCRIPTION: Composite: Sets a single yellow pixel at (332, 136) then Creates a black circular shape at (144, 104) with radius 59 then Places a white 112x45 rectangle at position (356, 175).
; PLAN: r0=332(x), r1=136(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=144(x), r6=104(y), r7=59(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=356(x), r11=175(y), r12=112(width), r13=45(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 332
LDI r1, 136
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 144
LDI r6, 104
LDI r7, 59
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 356
LDI r11, 175
LDI r12, 112
LDI r13, 45
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
