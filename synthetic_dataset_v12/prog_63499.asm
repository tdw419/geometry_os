; DESCRIPTION: Composite: Renders a yellow box of size 41x30 starting at (240, 115) then Draws a purple circle centered at (43, 43) with radius 23 then Places a white dot at position (157, 4).
; PLAN: r0=240(x), r1=115(y), r2=41(width), r3=30(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=43(x), r6=43(y), r7=23(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=157(x), r11=4(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 240
LDI r1, 115
LDI r2, 41
LDI r3, 30
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 43
LDI r6, 43
LDI r7, 23
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 157
LDI r11, 4
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
