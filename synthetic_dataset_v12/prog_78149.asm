; DESCRIPTION: Composite: Draws a magenta circle centered at (84, 82) with radius 25 then Sets a single cyan pixel at (67, 119) then Draws a magenta rectangle at (289, 8) with width 39 and height 88.
; PLAN: r0=84(x), r1=82(y), r2=25(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=67(x), r6=119(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=289(x), r11=8(y), r12=39(width), r13=88(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 84
LDI r1, 82
LDI r2, 25
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 67
LDI r6, 119
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 289
LDI r11, 8
LDI r12, 39
LDI r13, 88
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
