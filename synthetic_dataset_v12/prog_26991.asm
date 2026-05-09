; DESCRIPTION: Composite: Renders a yellow line between points (289, 58) and (44, 67) then Places a magenta dot at position (418, 156) then Draws a magenta circle centered at (49, 96) with radius 15.
; PLAN: r0=289(x1), r1=58(y1), r2=44(x2), r3=67(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=418(x), r6=156(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=49(x), r11=96(y), r12=15(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 289
LDI r1, 58
LDI r2, 44
LDI r3, 67
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 418
LDI r6, 156
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 49
LDI r11, 96
LDI r12, 15
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
