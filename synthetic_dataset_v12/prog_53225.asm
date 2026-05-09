; DESCRIPTION: Composite: Creates a yellow circular shape at (207, 158) with radius 68 then Places a blue dot at position (495, 17) then Renders a black box of size 77x55 starting at (202, 105).
; PLAN: r0=207(x), r1=158(y), r2=68(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=495(x), r6=17(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=202(x), r11=105(y), r12=77(width), r13=55(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 207
LDI r1, 158
LDI r2, 68
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 495
LDI r6, 17
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 202
LDI r11, 105
LDI r12, 77
LDI r13, 55
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
