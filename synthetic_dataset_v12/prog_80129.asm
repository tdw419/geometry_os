; DESCRIPTION: Composite: Creates a blue rectangular region at (251, 31) spanning 45 by 62 pixels then Draws a orange circle centered at (432, 197) with radius 37 then Sets a single red pixel at (53, 222).
; PLAN: r0=251(x), r1=31(y), r2=45(width), r3=62(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=432(x), r6=197(y), r7=37(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=53(x), r11=222(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 251
LDI r1, 31
LDI r2, 45
LDI r3, 62
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 432
LDI r6, 197
LDI r7, 37
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 53
LDI r11, 222
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
