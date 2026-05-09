; DESCRIPTION: Composite: Draws a magenta circle centered at (72, 107) with radius 12 then Places a purple dot at position (151, 98) then Places a orange 82x14 rectangle at position (184, 45).
; PLAN: r0=72(x), r1=107(y), r2=12(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=151(x), r6=98(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=184(x), r11=45(y), r12=82(width), r13=14(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 72
LDI r1, 107
LDI r2, 12
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 151
LDI r6, 98
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 184
LDI r11, 45
LDI r12, 82
LDI r13, 14
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
