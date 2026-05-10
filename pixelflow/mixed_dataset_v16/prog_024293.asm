; DESCRIPTION: Composite: Places a yellow 46x88 rectangle at position (189, 123) then Draws a black circle centered at (63, 165) with radius 55.
; PLAN: r0=189(x), r1=123(y), r2=46(width), r3=88(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=63(x), r6=165(y), r7=55(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 189
LDI r1, 123
LDI r2, 46
LDI r3, 88
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 63
LDI r6, 165
LDI r7, 55
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
