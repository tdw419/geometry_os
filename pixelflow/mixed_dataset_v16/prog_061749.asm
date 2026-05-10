; DESCRIPTION: Composite: Sets a single red pixel at (174, 58) then Creates a yellow circular shape at (255, 72) with radius 13 then Creates a blue rectangular region at (296, 63) spanning 74 by 67 pixels.
; PLAN: r0=174(x), r1=58(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=255(x), r6=72(y), r7=13(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=296(x), r11=63(y), r12=74(width), r13=67(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 174
LDI r1, 58
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 255
LDI r6, 72
LDI r7, 13
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 296
LDI r11, 63
LDI r12, 74
LDI r13, 67
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
