; DESCRIPTION: Composite: Draws a orange rectangle at (273, 115) with width 23 and height 62 then Creates a yellow circular shape at (408, 81) with radius 23 then Sets a single orange pixel at (475, 92).
; PLAN: r0=273(x), r1=115(y), r2=23(width), r3=62(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=408(x), r6=81(y), r7=23(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=475(x), r11=92(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 273
LDI r1, 115
LDI r2, 23
LDI r3, 62
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 408
LDI r6, 81
LDI r7, 23
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 475
LDI r11, 92
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
