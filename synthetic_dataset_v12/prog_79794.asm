; DESCRIPTION: Composite: Creates a blue circular shape at (309, 56) with radius 34 then Places a magenta dot at position (136, 2) then Draws a green rectangle at (113, 100) with width 87 and height 86.
; PLAN: r0=309(x), r1=56(y), r2=34(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=136(x), r6=2(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7 Next: r10=113(x), r11=100(y), r12=87(width), r13=86(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 309
LDI r1, 56
LDI r2, 34
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 136
LDI r6, 2
LDI r7, 0xFF00FF
PSET r5, r6, r7
LDI r10, 113
LDI r11, 100
LDI r12, 87
LDI r13, 86
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
