; DESCRIPTION: Composite: Places a green dot at position (285, 129) then Places a purple circle of radius 12 at center (127, 173) then Draws a orange rectangle at (376, 25) with width 110 and height 53.
; PLAN: r0=285(x), r1=129(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=127(x), r6=173(y), r7=12(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=376(x), r11=25(y), r12=110(width), r13=53(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 285
LDI r1, 129
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 127
LDI r6, 173
LDI r7, 12
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 376
LDI r11, 25
LDI r12, 110
LDI r13, 53
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
