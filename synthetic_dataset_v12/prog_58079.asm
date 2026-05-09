; DESCRIPTION: Composite: Places a purple 102x43 rectangle at position (340, 97) then Draws a green circle centered at (155, 80) with radius 58 then Sets a single white pixel at (333, 97).
; PLAN: r0=340(x), r1=97(y), r2=102(width), r3=43(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=155(x), r6=80(y), r7=58(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=333(x), r11=97(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 340
LDI r1, 97
LDI r2, 102
LDI r3, 43
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 155
LDI r6, 80
LDI r7, 58
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 333
LDI r11, 97
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
