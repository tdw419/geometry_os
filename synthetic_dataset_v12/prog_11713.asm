; DESCRIPTION: Composite: Draws a white rectangle at (215, 160) with width 67 and height 55 then Draws a cyan circle centered at (415, 123) with radius 57 then Places a green dot at position (88, 254).
; PLAN: r0=215(x), r1=160(y), r2=67(width), r3=55(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=123(y), r7=57(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x), r11=254(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 215
LDI r1, 160
LDI r2, 67
LDI r3, 55
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 123
LDI r7, 57
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 254
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
