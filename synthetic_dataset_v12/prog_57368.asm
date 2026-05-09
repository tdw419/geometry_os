; DESCRIPTION: Composite: Places a cyan line segment connecting (222, 45) to (167, 137) then Draws a black circle centered at (138, 147) with radius 43 then Places a magenta 76x62 rectangle at position (49, 125).
; PLAN: r0=222(x1), r1=45(y1), r2=167(x2), r3=137(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=147(y), r7=43(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=49(x), r11=125(y), r12=76(width), r13=62(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 222
LDI r1, 45
LDI r2, 167
LDI r3, 137
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 147
LDI r7, 43
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 49
LDI r11, 125
LDI r12, 76
LDI r13, 62
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
