; DESCRIPTION: Composite: Draws a magenta circle centered at (406, 122) with radius 15 then Places a blue 107x102 rectangle at position (101, 25) then Sets a single cyan pixel at (475, 149).
; PLAN: r0=406(x), r1=122(y), r2=15(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=101(x), r6=25(y), r7=107(width), r8=102(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=475(x), r11=149(y), r12=0x00FFFF(color). Op: PSET r10, r11, r12.
LDI r0, 406
LDI r1, 122
LDI r2, 15
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 101
LDI r6, 25
LDI r7, 107
LDI r8, 102
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
LDI r10, 475
LDI r11, 149
LDI r12, 0x00FFFF
PSET r10, r11, r12
HALT
