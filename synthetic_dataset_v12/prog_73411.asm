; DESCRIPTION: Composite: Draws a black circle centered at (354, 89) with radius 49 then Creates a magenta rectangular region at (295, 159) spanning 19 by 32 pixels.
; PLAN: r0=354(x), r1=89(y), r2=49(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=159(y), r7=19(width), r8=32(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 354
LDI r1, 89
LDI r2, 49
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 159
LDI r7, 19
LDI r8, 32
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
