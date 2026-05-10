; DESCRIPTION: Composite: Draws a black rectangle at (467, 33) with width 15 and height 110 then Draws a orange circle centered at (107, 154) with radius 47 then Sets a single magenta pixel at (60, 186).
; PLAN: r0=467(x), r1=33(y), r2=15(width), r3=110(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=107(x), r6=154(y), r7=47(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=60(x), r11=186(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 467
LDI r1, 33
LDI r2, 15
LDI r3, 110
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 107
LDI r6, 154
LDI r7, 47
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 60
LDI r11, 186
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
