; DESCRIPTION: Composite: Draws a white rectangle at (283, 73) with width 63 and height 29 then Draws a yellow circle centered at (184, 100) with radius 36 then Sets a single cyan pixel at (33, 195).
; PLAN: r0=283(x), r1=73(y), r2=63(width), r3=29(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x), r6=100(y), r7=36(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=33(x), r11=195(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 283
LDI r1, 73
LDI r2, 63
LDI r3, 29
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 100
LDI r7, 36
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 33
LDI r11, 195
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
