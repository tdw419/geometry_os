; DESCRIPTION: Composite: Places a yellow circle of radius 38 at center (369, 167) then Sets a single white pixel at (466, 161) then Draws a green rectangle at (134, 179) with width 61 and height 35.
; PLAN: r0=369(x), r1=167(y), r2=38(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=466(x), r6=161(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=134(x), r11=179(y), r12=61(width), r13=35(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 369
LDI r1, 167
LDI r2, 38
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 466
LDI r6, 161
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 134
LDI r11, 179
LDI r12, 61
LDI r13, 35
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
