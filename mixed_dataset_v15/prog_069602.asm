; DESCRIPTION: Composite: Draws a black circle centered at (165, 76) with radius 73 then Places a orange 22x30 rectangle at position (240, 101) then Places a orange dot at position (389, 1).
; PLAN: r0=165(x), r1=76(y), r2=73(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=240(x), r6=101(y), r7=22(width), r8=30(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=389(x), r11=1(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 165
LDI r1, 76
LDI r2, 73
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 240
LDI r6, 101
LDI r7, 22
LDI r8, 30
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 389
LDI r11, 1
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
