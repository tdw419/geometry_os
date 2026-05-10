; DESCRIPTION: Composite: Sets a single magenta pixel at (323, 222) then Places a orange circle of radius 55 at center (81, 144) then Draws a black rectangle at (382, 11) with width 19 and height 109.
; PLAN: r0=323(x), r1=222(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=81(x), r6=144(y), r7=55(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=382(x), r11=11(y), r12=19(width), r13=109(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 323
LDI r1, 222
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 81
LDI r6, 144
LDI r7, 55
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 382
LDI r11, 11
LDI r12, 19
LDI r13, 109
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
