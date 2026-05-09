; DESCRIPTION: Composite: Places a blue circle of radius 45 at center (303, 58) then Places a green dot at position (318, 249) then Renders a black box of size 26x49 starting at (151, 99).
; PLAN: r0=303(x), r1=58(y), r2=45(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=318(x), r6=249(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=151(x), r11=99(y), r12=26(width), r13=49(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 303
LDI r1, 58
LDI r2, 45
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 318
LDI r6, 249
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 151
LDI r11, 99
LDI r12, 26
LDI r13, 49
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
