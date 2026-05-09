; DESCRIPTION: Composite: Sets a single green pixel at (384, 157) then Places a white circle of radius 74 at center (173, 123) then Places a orange 45x56 rectangle at position (148, 81).
; PLAN: r0=384(x), r1=157(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=173(x), r6=123(y), r7=74(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=148(x), r11=81(y), r12=45(width), r13=56(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 384
LDI r1, 157
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 173
LDI r6, 123
LDI r7, 74
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 148
LDI r11, 81
LDI r12, 45
LDI r13, 56
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
