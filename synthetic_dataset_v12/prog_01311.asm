; DESCRIPTION: Composite: Sets a single black pixel at (367, 59) then Draws a yellow circle centered at (197, 104) with radius 72 then Renders a white box of size 73x78 starting at (175, 12).
; PLAN: r0=367(x), r1=59(y), r2=0x000000(color). Op: PSET r0, r1, r2 Next: r5=197(x), r6=104(y), r7=72(radius), r8=0xFFFF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=175(x), r11=12(y), r12=73(width), r13=78(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 367
LDI r1, 59
LDI r2, 0x000000
PSET r0, r1, r2
LDI r5, 197
LDI r6, 104
LDI r7, 72
LDI r8, 0xFFFF00
CIRCLE r5, r6, r7, r8
LDI r10, 175
LDI r11, 12
LDI r12, 73
LDI r13, 78
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
