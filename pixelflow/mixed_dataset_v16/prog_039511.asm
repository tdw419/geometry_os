; DESCRIPTION: Composite: Places a orange dot at position (30, 233) then Draws a blue circle centered at (122, 161) with radius 76 then Draws a green rectangle at (71, 41) with width 45 and height 105.
; PLAN: r0=30(x), r1=233(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=122(x), r6=161(y), r7=76(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=71(x), r11=41(y), r12=45(width), r13=105(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 30
LDI r1, 233
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 122
LDI r6, 161
LDI r7, 76
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 71
LDI r11, 41
LDI r12, 45
LDI r13, 105
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
