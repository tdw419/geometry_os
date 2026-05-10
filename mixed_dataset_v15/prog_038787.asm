; DESCRIPTION: Composite: Draws a purple circle centered at (140, 108) with radius 78 then Sets a single white pixel at (465, 225) then Draws a red rectangle at (101, 166) with width 57 and height 55.
; PLAN: r0=140(x), r1=108(y), r2=78(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=465(x), r6=225(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=101(x), r11=166(y), r12=57(width), r13=55(height), r14=0xFF0000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 140
LDI r1, 108
LDI r2, 78
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 465
LDI r6, 225
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 101
LDI r11, 166
LDI r12, 57
LDI r13, 55
LDI r14, 0xFF0000
RECTF r10, r11, r12, r13, r14
HALT
