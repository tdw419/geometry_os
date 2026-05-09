; DESCRIPTION: Composite: Creates a magenta circular shape at (316, 59) with radius 46 then Places a yellow dot at position (20, 70) then Draws a black rectangle at (373, 63) with width 56 and height 86.
; PLAN: r0=316(x), r1=59(y), r2=46(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=20(x), r6=70(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7 Next: r10=373(x), r11=63(y), r12=56(width), r13=86(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 316
LDI r1, 59
LDI r2, 46
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 20
LDI r6, 70
LDI r7, 0xFFFF00
PSET r5, r6, r7
LDI r10, 373
LDI r11, 63
LDI r12, 56
LDI r13, 86
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
