; DESCRIPTION: Composite: Sets a single blue pixel at (85, 64) then Places a red 24x28 rectangle at position (475, 116) then Draws a black circle centered at (146, 113) with radius 31.
; PLAN: r0=85(x), r1=64(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=475(x), r6=116(y), r7=24(width), r8=28(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=146(x), r11=113(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 85
LDI r1, 64
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 475
LDI r6, 116
LDI r7, 24
LDI r8, 28
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 146
LDI r11, 113
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
