; DESCRIPTION: Composite: Draws a red rectangle at (91, 202) with width 98 and height 10 then Creates a red circular shape at (68, 165) with radius 53 then Places a green dot at position (88, 43).
; PLAN: r0=91(x), r1=202(y), r2=98(width), r3=10(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=68(x), r6=165(y), r7=53(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x), r11=43(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 91
LDI r1, 202
LDI r2, 98
LDI r3, 10
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 68
LDI r6, 165
LDI r7, 53
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 43
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
