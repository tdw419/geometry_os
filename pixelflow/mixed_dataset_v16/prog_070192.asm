; DESCRIPTION: Composite: Places a red 107x17 rectangle at position (181, 115) then Draws a yellow circle centered at (122, 84) with radius 74.
; PLAN: r0=181(x), r1=115(y), r2=107(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=122(x), r6=84(y), r7=74(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 181
LDI r1, 115
LDI r2, 107
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 122
LDI r6, 84
LDI r7, 74
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
HALT
