; DESCRIPTION: Composite: Draws a orange circle centered at (296, 154) with radius 53 then Places a blue line segment connecting (210, 163) to (280, 245) then Creates a white rectangular region at (156, 143) spanning 63 by 101 pixels.
; PLAN: r0=296(x), r1=154(y), r2=53(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=210(x1), r6=163(y1), r7=280(x2), r8=245(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=156(x), r11=143(y), r12=63(width), r13=101(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 296
LDI r1, 154
LDI r2, 53
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 210
LDI r6, 163
LDI r7, 280
LDI r8, 245
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 156
LDI r11, 143
LDI r12, 63
LDI r13, 101
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
