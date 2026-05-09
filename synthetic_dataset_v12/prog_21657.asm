; DESCRIPTION: Composite: Places a orange dot at position (187, 76) then Draws a black circle centered at (225, 113) with radius 37 then Places a yellow 25x28 rectangle at position (275, 132).
; PLAN: r0=187(x), r1=76(y), r2=0xFF8800(color). Op: PSET r0, r1, r2 Next: r5=225(x), r6=113(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=275(x), r11=132(y), r12=25(width), r13=28(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 187
LDI r1, 76
LDI r2, 0xFF8800
PSET r0, r1, r2
LDI r5, 225
LDI r6, 113
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 275
LDI r11, 132
LDI r12, 25
LDI r13, 28
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
