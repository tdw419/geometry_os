; DESCRIPTION: Composite: Sets a single white pixel at (76, 85) then Places a green circle of radius 25 at center (356, 213) then Draws a yellow rectangle at (284, 49) with width 104 and height 63.
; PLAN: r0=76(x), r1=85(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=356(x), r6=213(y), r7=25(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=284(x), r11=49(y), r12=104(width), r13=63(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 76
LDI r1, 85
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 356
LDI r6, 213
LDI r7, 25
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 284
LDI r11, 49
LDI r12, 104
LDI r13, 63
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
