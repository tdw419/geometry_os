; DESCRIPTION: Composite: Draws a blue rectangle at (163, 127) with width 105 and height 81 then Sets a single orange pixel at (138, 205) then Draws a white circle centered at (109, 110) with radius 50.
; PLAN: r0=163(x), r1=127(y), r2=105(width), r3=81(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=205(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=109(x), r11=110(y), r12=50(radius), r13=0xFFFFFF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 163
LDI r1, 127
LDI r2, 105
LDI r3, 81
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 205
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 109
LDI r11, 110
LDI r12, 50
LDI r13, 0xFFFFFF
CIRCLE r10, r11, r12, r13
HALT
