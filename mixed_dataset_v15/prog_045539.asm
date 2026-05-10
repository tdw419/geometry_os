; DESCRIPTION: Composite: Draws a yellow rectangle at (335, 62) with width 92 and height 102 then Places a green circle of radius 21 at center (183, 97) then Sets a single cyan pixel at (89, 106).
; PLAN: r0=335(x), r1=62(y), r2=92(width), r3=102(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x), r6=97(y), r7=21(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=89(x), r11=106(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 335
LDI r1, 62
LDI r2, 92
LDI r3, 102
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 97
LDI r7, 21
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 89
LDI r11, 106
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
