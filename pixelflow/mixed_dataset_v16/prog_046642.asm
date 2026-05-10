; DESCRIPTION: Composite: Places a black circle of radius 17 at center (227, 49) then Draws a magenta rectangle at (57, 3) with width 108 and height 94.
; PLAN: r0=227(x), r1=49(y), r2=17(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=57(x), r6=3(y), r7=108(width), r8=94(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 227
LDI r1, 49
LDI r2, 17
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 57
LDI r6, 3
LDI r7, 108
LDI r8, 94
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
