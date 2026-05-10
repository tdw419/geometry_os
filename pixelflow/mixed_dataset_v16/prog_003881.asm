; DESCRIPTION: Composite: Places a blue 94x57 rectangle at position (345, 43) then Draws a red circle centered at (227, 78) with radius 40 then Places a orange dot at position (239, 97).
; PLAN: r0=345(x), r1=43(y), r2=94(width), r3=57(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=227(x), r6=78(y), r7=40(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=239(x), r11=97(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 345
LDI r1, 43
LDI r2, 94
LDI r3, 57
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 227
LDI r6, 78
LDI r7, 40
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 239
LDI r11, 97
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
