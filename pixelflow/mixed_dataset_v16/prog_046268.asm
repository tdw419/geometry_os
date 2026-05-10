; DESCRIPTION: Composite: Draws a green rectangle at (159, 32) with width 47 and height 12 then Renders a green disk with center (276, 41) and radius 15 then Places a green dot at position (386, 16).
; PLAN: r0=159(x), r1=32(y), r2=47(width), r3=12(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=276(x), r6=41(y), r7=15(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=386(x), r11=16(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 159
LDI r1, 32
LDI r2, 47
LDI r3, 12
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 276
LDI r6, 41
LDI r7, 15
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 386
LDI r11, 16
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
