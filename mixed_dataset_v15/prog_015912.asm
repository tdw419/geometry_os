; DESCRIPTION: Composite: Draws a red circle centered at (248, 80) with radius 67 then Sets a single orange pixel at (436, 116) then Draws a orange rectangle at (53, 165) with width 65 and height 71.
; PLAN: r0=248(x), r1=80(y), r2=67(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=436(x), r6=116(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=53(x), r11=165(y), r12=65(width), r13=71(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 248
LDI r1, 80
LDI r2, 67
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 436
LDI r6, 116
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 53
LDI r11, 165
LDI r12, 65
LDI r13, 71
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
