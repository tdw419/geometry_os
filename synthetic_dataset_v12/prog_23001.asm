; DESCRIPTION: Composite: Sets a single magenta pixel at (239, 4) then Creates a white circular shape at (457, 151) with radius 18 then Places a purple 95x10 rectangle at position (0, 64).
; PLAN: r0=239(x), r1=4(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=457(x), r6=151(y), r7=18(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=0(x), r11=64(y), r12=95(width), r13=10(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 4
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 457
LDI r6, 151
LDI r7, 18
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 0
LDI r11, 64
LDI r12, 95
LDI r13, 10
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
