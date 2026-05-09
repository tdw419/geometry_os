; DESCRIPTION: Composite: Sets a single purple pixel at (466, 162) then Creates a magenta circular shape at (460, 165) with radius 42 then Places a black 49x32 rectangle at position (161, 59).
; PLAN: r0=466(x), r1=162(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=460(x), r6=165(y), r7=42(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=59(y), r12=49(width), r13=32(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 466
LDI r1, 162
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 460
LDI r6, 165
LDI r7, 42
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 59
LDI r12, 49
LDI r13, 32
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
