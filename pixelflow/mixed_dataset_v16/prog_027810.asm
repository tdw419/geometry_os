; DESCRIPTION: Composite: Creates a orange circular shape at (232, 155) with radius 31 then Sets a single purple pixel at (103, 147) then Renders a black box of size 111x22 starting at (257, 113).
; PLAN: r0=232(x), r1=155(y), r2=31(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x), r6=147(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=257(x), r11=113(y), r12=111(width), r13=22(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 232
LDI r1, 155
LDI r2, 31
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 147
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 257
LDI r11, 113
LDI r12, 111
LDI r13, 22
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
