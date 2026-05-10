; DESCRIPTION: Composite: Creates a green circular shape at (255, 88) with radius 28 then Draws a blue rectangle at (178, 163) with width 79 and height 33 then Places a yellow dot at position (234, 145).
; PLAN: r0=255(x), r1=88(y), r2=28(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=178(x), r6=163(y), r7=79(width), r8=33(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=234(x), r11=145(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 255
LDI r1, 88
LDI r2, 28
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 178
LDI r6, 163
LDI r7, 79
LDI r8, 33
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 145
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
