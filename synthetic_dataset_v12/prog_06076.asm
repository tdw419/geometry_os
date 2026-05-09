; DESCRIPTION: Composite: Draws a black rectangle at (12, 150) with width 100 and height 57 then Places a red dot at position (46, 78) then Creates a black circular shape at (183, 80) with radius 49.
; PLAN: r0=12(x), r1=150(y), r2=100(width), r3=57(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=46(x), r6=78(y), r7=0xFF0000(color). Op: PSET r5, r6, r7 Next: r10=183(x), r11=80(y), r12=49(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 12
LDI r1, 150
LDI r2, 100
LDI r3, 57
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 46
LDI r6, 78
LDI r7, 0xFF0000
PSET r5, r6, r7
LDI r10, 183
LDI r11, 80
LDI r12, 49
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
