; DESCRIPTION: Composite: Draws a magenta rectangle at (192, 110) with width 117 and height 65 then Renders a blue disk with center (301, 129) and radius 39 then Places a yellow dot at position (339, 122).
; PLAN: r0=192(x), r1=110(y), r2=117(width), r3=65(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=301(x), r6=129(y), r7=39(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=339(x), r11=122(y), r12=0xFFFF00(color). Op: PSET r10, r11, r12.
LDI r0, 192
LDI r1, 110
LDI r2, 117
LDI r3, 65
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 301
LDI r6, 129
LDI r7, 39
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 339
LDI r11, 122
LDI r12, 0xFFFF00
PSET r10, r11, r12
HALT
