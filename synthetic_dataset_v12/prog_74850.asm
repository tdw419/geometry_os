; DESCRIPTION: Composite: Draws a cyan rectangle at (303, 14) with width 69 and height 17 then Places a white dot at position (50, 130) then Creates a black circular shape at (45, 225) with radius 31.
; PLAN: r0=303(x), r1=14(y), r2=69(width), r3=17(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=50(x), r6=130(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=45(x), r11=225(y), r12=31(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 303
LDI r1, 14
LDI r2, 69
LDI r3, 17
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 50
LDI r6, 130
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 45
LDI r11, 225
LDI r12, 31
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
