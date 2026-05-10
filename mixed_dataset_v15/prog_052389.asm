; DESCRIPTION: Composite: Sets a single red pixel at (261, 232) then Creates a green circular shape at (238, 92) with radius 63 then Places a magenta 42x94 rectangle at position (231, 104).
; PLAN: r0=261(x), r1=232(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=238(x), r6=92(y), r7=63(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=231(x), r11=104(y), r12=42(width), r13=94(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 261
LDI r1, 232
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 238
LDI r6, 92
LDI r7, 63
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 231
LDI r11, 104
LDI r12, 42
LDI r13, 94
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
