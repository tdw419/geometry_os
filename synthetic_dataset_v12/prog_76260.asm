; DESCRIPTION: Composite: Sets a single cyan pixel at (139, 62) then Creates a orange circular shape at (139, 189) with radius 32 then Places a white 42x71 rectangle at position (132, 16).
; PLAN: r0=139(x), r1=62(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=139(x), r6=189(y), r7=32(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=132(x), r11=16(y), r12=42(width), r13=71(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 139
LDI r1, 62
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 139
LDI r6, 189
LDI r7, 32
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 132
LDI r11, 16
LDI r12, 42
LDI r13, 71
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
