; DESCRIPTION: Composite: Draws a blue rectangle at (190, 198) with width 43 and height 53 then Sets a single cyan pixel at (409, 86) then Places a black circle of radius 24 at center (58, 93).
; PLAN: r0=190(x), r1=198(y), r2=43(width), r3=53(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=409(x), r6=86(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=58(x), r11=93(y), r12=24(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 190
LDI r1, 198
LDI r2, 43
LDI r3, 53
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 86
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 58
LDI r11, 93
LDI r12, 24
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
