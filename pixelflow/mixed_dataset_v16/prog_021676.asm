; DESCRIPTION: Composite: Draws a black rectangle at (122, 56) with width 51 and height 82 then Creates a black circular shape at (190, 69) with radius 41 then Places a green dot at position (300, 37).
; PLAN: r0=122(x), r1=56(y), r2=51(width), r3=82(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=190(x), r6=69(y), r7=41(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=300(x), r11=37(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 56
LDI r2, 51
LDI r3, 82
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 190
LDI r6, 69
LDI r7, 41
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 300
LDI r11, 37
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
