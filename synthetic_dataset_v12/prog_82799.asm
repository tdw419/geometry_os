; DESCRIPTION: Composite: Sets a single black pixel at (111, 175) then Draws a yellow circle centered at (218, 83) with radius 46 then Draws a black rectangle at (394, 41) with width 61 and height 119.
; PLAN: r0=111(x), r1=175(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=218(x), r6=83(y), r7=46(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=394(x), r11=41(y), r12=61(width), r13=119(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 111
LDI r1, 175
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 218
LDI r6, 83
LDI r7, 46
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 394
LDI r11, 41
LDI r12, 61
LDI r13, 119
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
