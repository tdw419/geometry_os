; DESCRIPTION: Composite: Places a blue circle of radius 29 at center (451, 122) then Renders a yellow box of size 11x80 starting at (129, 17) then Places a blue dot at position (159, 198).
; PLAN: r0=451(x), r1=122(y), r2=29(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=129(x), r6=17(y), r7=11(width), r8=80(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=159(x), r11=198(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 451
LDI r1, 122
LDI r2, 29
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 129
LDI r6, 17
LDI r7, 11
LDI r8, 80
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
LDI r10, 159
LDI r11, 198
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
