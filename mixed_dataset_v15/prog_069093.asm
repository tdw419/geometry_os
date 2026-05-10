; DESCRIPTION: Composite: Draws a purple rectangle at (205, 90) with width 59 and height 45 then Places a black dot at position (3, 1) then Creates a green circular shape at (327, 173) with radius 63.
; PLAN: r0=205(x), r1=90(y), r2=59(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=3(x), r6=1(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=327(x), r11=173(y), r12=63(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 205
LDI r1, 90
LDI r2, 59
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 1
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 327
LDI r11, 173
LDI r12, 63
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
