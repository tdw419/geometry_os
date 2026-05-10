; DESCRIPTION: Composite: Draws a yellow rectangle at (156, 159) with width 78 and height 19 then Creates a red circular shape at (207, 192) with radius 59 then Places a green dot at position (264, 220).
; PLAN: r0=156(x), r1=159(y), r2=78(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=207(x), r6=192(y), r7=59(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=264(x), r11=220(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 156
LDI r1, 159
LDI r2, 78
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 207
LDI r6, 192
LDI r7, 59
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 264
LDI r11, 220
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
