; DESCRIPTION: Composite: Creates a purple rectangular region at (144, 144) spanning 38 by 36 pixels then Draws a orange circle centered at (231, 18) with radius 13 then Places a red dot at position (479, 163).
; PLAN: r0=144(x), r1=144(y), r2=38(width), r3=36(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=231(x), r6=18(y), r7=13(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=479(x), r11=163(y), r12=0xFF0000(color). Op: PSET r10, r11, r12.
LDI r0, 144
LDI r1, 144
LDI r2, 38
LDI r3, 36
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 231
LDI r6, 18
LDI r7, 13
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 479
LDI r11, 163
LDI r12, 0xFF0000
PSET r10, r11, r12
HALT
