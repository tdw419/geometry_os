; DESCRIPTION: Composite: Creates a orange circular shape at (381, 167) with radius 22 then Places a yellow dot at position (199, 116) then Places a purple 119x93 rectangle at position (104, 100).
; PLAN: r0=381(x), r1=167(y), r2=22(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=199(x), r6=116(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=104(x), r11=100(y), r12=119(width), r13=93(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 381
LDI r1, 167
LDI r2, 22
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 199
LDI r6, 116
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 104
LDI r11, 100
LDI r12, 119
LDI r13, 93
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
