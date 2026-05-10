; DESCRIPTION: Composite: Sets a single blue pixel at (145, 129) then Places a purple circle of radius 13 at center (123, 194) then Draws a purple rectangle at (155, 151) with width 57 and height 36.
; PLAN: r0=145(x), r1=129(y), r2=0x0000FF(color). Op: PSET r0, r1, r2 Next: r5=123(x), r6=194(y), r7=13(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=155(x), r11=151(y), r12=57(width), r13=36(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 145
LDI r1, 129
LDI r2, 0x0000FF
PSET r0, r1, r2
LDI r5, 123
LDI r6, 194
LDI r7, 13
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
LDI r10, 155
LDI r11, 151
LDI r12, 57
LDI r13, 36
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
