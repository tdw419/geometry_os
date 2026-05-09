; DESCRIPTION: Composite: Places a purple circle of radius 17 at center (382, 225) then Places a blue dot at position (459, 155) then Renders a white box of size 33x23 starting at (474, 222).
; PLAN: r0=382(x), r1=225(y), r2=17(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=459(x), r6=155(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=474(x), r11=222(y), r12=33(width), r13=23(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 382
LDI r1, 225
LDI r2, 17
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 459
LDI r6, 155
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 474
LDI r11, 222
LDI r12, 33
LDI r13, 23
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
