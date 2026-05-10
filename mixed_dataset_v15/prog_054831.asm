; DESCRIPTION: Composite: Draws a red rectangle at (364, 95) with width 68 and height 105 then Places a blue dot at position (434, 85) then Draws a yellow circle centered at (414, 178) with radius 64.
; PLAN: r0=364(x), r1=95(y), r2=68(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=434(x), r6=85(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=414(x), r11=178(y), r12=64(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 364
LDI r1, 95
LDI r2, 68
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 434
LDI r6, 85
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 414
LDI r11, 178
LDI r12, 64
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
