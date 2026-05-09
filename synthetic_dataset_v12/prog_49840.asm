; DESCRIPTION: Composite: Renders a white box of size 56x98 starting at (304, 45) then Places a cyan dot at position (492, 189) then Draws a magenta circle centered at (257, 192) with radius 45.
; PLAN: r0=304(x), r1=45(y), r2=56(width), r3=98(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=492(x), r6=189(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=192(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 304
LDI r1, 45
LDI r2, 56
LDI r3, 98
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 492
LDI r6, 189
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 257
LDI r11, 192
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
