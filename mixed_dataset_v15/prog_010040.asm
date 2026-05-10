; DESCRIPTION: Composite: Draws a magenta rectangle at (122, 0) with width 91 and height 29 then Places a red circle of radius 34 at center (84, 34) then Sets a single white pixel at (395, 86).
; PLAN: r0=122(x), r1=0(y), r2=91(width), r3=29(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=84(x), r6=34(y), r7=34(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=395(x), r11=86(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 122
LDI r1, 0
LDI r2, 91
LDI r3, 29
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 84
LDI r6, 34
LDI r7, 34
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 395
LDI r11, 86
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
