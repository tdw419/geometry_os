; DESCRIPTION: Composite: Draws a green rectangle at (292, 14) with width 64 and height 104 then Sets a single black pixel at (294, 79) then Creates a yellow circular shape at (467, 86) with radius 22.
; PLAN: r0=292(x), r1=14(y), r2=64(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=294(x), r6=79(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=467(x), r11=86(y), r12=22(radius), r13=0xFFFF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 292
LDI r1, 14
LDI r2, 64
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 294
LDI r6, 79
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 467
LDI r11, 86
LDI r12, 22
LDI r13, 0xFFFF00
CIRCLE r10, r11, r12, r13
HALT
