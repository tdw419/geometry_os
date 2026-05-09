; DESCRIPTION: Composite: Sets a single white pixel at (469, 159) then Draws a cyan circle centered at (479, 226) with radius 13 then Draws a orange rectangle at (117, 206) with width 53 and height 43.
; PLAN: r0=469(x), r1=159(y), r2=0xFFFFFF(color). Op: PSET r0, r1, r2 Next: r5=479(x), r6=226(y), r7=13(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=117(x), r11=206(y), r12=53(width), r13=43(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 469
LDI r1, 159
LDI r2, 0xFFFFFF
PSET r0, r1, r2
LDI r5, 479
LDI r6, 226
LDI r7, 13
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 117
LDI r11, 206
LDI r12, 53
LDI r13, 43
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
