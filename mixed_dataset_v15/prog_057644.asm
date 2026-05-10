; DESCRIPTION: Composite: Draws a white circle centered at (156, 154) with radius 67 then Sets a single blue pixel at (452, 20) then Places a green 88x41 rectangle at position (73, 88).
; PLAN: r0=156(x), r1=154(y), r2=67(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=452(x), r6=20(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=73(x), r11=88(y), r12=88(width), r13=41(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 156
LDI r1, 154
LDI r2, 67
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 452
LDI r6, 20
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 73
LDI r11, 88
LDI r12, 88
LDI r13, 41
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
