; DESCRIPTION: Composite: Draws a orange rectangle at (60, 169) with width 119 and height 73 then Sets a single orange pixel at (409, 60) then Draws a blue circle centered at (254, 136) with radius 42.
; PLAN: r0=60(x), r1=169(y), r2=119(width), r3=73(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=60(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=254(x), r11=136(y), r12=42(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 60
LDI r1, 169
LDI r2, 119
LDI r3, 73
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 60
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 254
LDI r11, 136
LDI r12, 42
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
