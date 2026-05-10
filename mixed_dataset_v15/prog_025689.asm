; DESCRIPTION: Composite: Creates a magenta circular shape at (263, 172) with radius 24 then Draws a black rectangle at (237, 2) with width 104 and height 61 then Sets a single red pixel at (29, 6).
; PLAN: r0=263(x), r1=172(y), r2=24(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=237(x), r6=2(y), r7=104(width), r8=61(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=29(x), r11=6(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 263
LDI r1, 172
LDI r2, 24
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 237
LDI r6, 2
LDI r7, 104
LDI r8, 61
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
LDI r10, 29
LDI r11, 6
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
