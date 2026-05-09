; DESCRIPTION: Composite: Places a green circle of radius 58 at center (419, 176) then Sets a single white pixel at (29, 5) then Draws a green rectangle at (474, 67) with width 26 and height 27.
; PLAN: r0=419(x), r1=176(y), r2=58(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x), r6=5(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=474(x), r11=67(y), r12=26(width), r13=27(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 419
LDI r1, 176
LDI r2, 58
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 5
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 67
LDI r12, 26
LDI r13, 27
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
