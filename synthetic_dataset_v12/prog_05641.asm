; DESCRIPTION: Composite: Places a yellow dot at position (386, 182) then Draws a black circle centered at (87, 171) with radius 19 then Draws a green rectangle at (395, 21) with width 35 and height 15.
; PLAN: r0=386(x), r1=182(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=87(x), r6=171(y), r7=19(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=395(x), r11=21(y), r12=35(width), r13=15(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 386
LDI r1, 182
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 87
LDI r6, 171
LDI r7, 19
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 395
LDI r11, 21
LDI r12, 35
LDI r13, 15
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
