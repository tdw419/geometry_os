; DESCRIPTION: Composite: Sets a single cyan pixel at (65, 110) then Draws a orange rectangle at (380, 99) with width 62 and height 60 then Draws a magenta circle centered at (119, 159) with radius 45.
; PLAN: r0=65(x), r1=110(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=380(x), r6=99(y), r7=62(width), r8=60(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=119(x), r11=159(y), r12=45(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 65
LDI r1, 110
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 380
LDI r6, 99
LDI r7, 62
LDI r8, 60
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 119
LDI r11, 159
LDI r12, 45
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
