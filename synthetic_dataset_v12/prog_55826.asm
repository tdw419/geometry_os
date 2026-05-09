; DESCRIPTION: Composite: Places a red dot at position (381, 24) then Places a black circle of radius 67 at center (369, 171) then Places a white 14x83 rectangle at position (234, 49).
; PLAN: r0=381(x), r1=24(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=369(x), r6=171(y), r7=67(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=234(x), r11=49(y), r12=14(width), r13=83(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 24
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 369
LDI r6, 171
LDI r7, 67
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 234
LDI r11, 49
LDI r12, 14
LDI r13, 83
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
