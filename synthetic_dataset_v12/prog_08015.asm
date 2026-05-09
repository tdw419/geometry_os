; DESCRIPTION: Composite: Sets a single red pixel at (336, 11) then Places a white circle of radius 54 at center (455, 104) then Creates a red rectangular region at (137, 56) spanning 76 by 71 pixels.
; PLAN: r0=336(x), r1=11(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=455(x), r6=104(y), r7=54(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=137(x), r11=56(y), r12=76(width), r13=71(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 336
LDI r1, 11
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 455
LDI r6, 104
LDI r7, 54
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 137
LDI r11, 56
LDI r12, 76
LDI r13, 71
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
