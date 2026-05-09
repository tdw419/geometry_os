; DESCRIPTION: Composite: Draws a black rectangle at (391, 83) with width 77 and height 47 then Places a white dot at position (130, 58) then Draws a black circle centered at (223, 137) with radius 17.
; PLAN: r0=391(x), r1=83(y), r2=77(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x), r6=58(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=223(x), r11=137(y), r12=17(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 391
LDI r1, 83
LDI r2, 77
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 58
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 223
LDI r11, 137
LDI r12, 17
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
