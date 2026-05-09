; DESCRIPTION: Composite: Renders a purple box of size 39x21 starting at (81, 165) then Draws a yellow circle centered at (415, 151) with radius 54 then Sets a single blue pixel at (483, 139).
; PLAN: r0=81(x), r1=165(y), r2=39(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=415(x), r6=151(y), r7=54(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=483(x), r11=139(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 81
LDI r1, 165
LDI r2, 39
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 415
LDI r6, 151
LDI r7, 54
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 483
LDI r11, 139
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
