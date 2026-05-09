; DESCRIPTION: Composite: Renders a blue box of size 76x117 starting at (396, 30) then Draws a white circle centered at (249, 24) with radius 21 then Places a orange dot at position (146, 159).
; PLAN: r0=396(x), r1=30(y), r2=76(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=249(x), r6=24(y), r7=21(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=146(x), r11=159(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 396
LDI r1, 30
LDI r2, 76
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 249
LDI r6, 24
LDI r7, 21
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 146
LDI r11, 159
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
