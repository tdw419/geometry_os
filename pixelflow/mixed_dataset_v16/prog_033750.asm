; DESCRIPTION: Composite: Renders a green box of size 23x38 starting at (424, 18) then Places a black dot at position (191, 122) then Places a black circle of radius 55 at center (147, 129).
; PLAN: r0=424(x), r1=18(y), r2=23(width), r3=38(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=191(x), r6=122(y), r7=0x000000(color). Op: PSET r5, r6, r7 Next: r10=147(x), r11=129(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 424
LDI r1, 18
LDI r2, 23
LDI r3, 38
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 191
LDI r6, 122
LDI r7, 0x000000
PSET r5, r6, r7
LDI r10, 147
LDI r11, 129
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
