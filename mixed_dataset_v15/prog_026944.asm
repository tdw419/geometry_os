; DESCRIPTION: Composite: Draws a green rectangle at (19, 45) with width 117 and height 12 then Sets a single red pixel at (341, 224) then Places a orange circle of radius 41 at center (290, 105).
; PLAN: r0=19(x), r1=45(y), r2=117(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=341(x), r6=224(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=290(x), r11=105(y), r12=41(radius), r13=0xFF8800(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 19
LDI r1, 45
LDI r2, 117
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 341
LDI r6, 224
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 290
LDI r11, 105
LDI r12, 41
LDI r13, 0xFF8800
CIRCLE r10, r11, r12, r13
HALT
