; DESCRIPTION: Composite: Creates a orange circular shape at (14, 130) with radius 12 then Places a blue dot at position (313, 21) then Creates a blue rectangular region at (341, 71) spanning 105 by 90 pixels.
; PLAN: r0=14(x), r1=130(y), r2=12(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=313(x), r6=21(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=341(x), r11=71(y), r12=105(width), r13=90(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 14
LDI r1, 130
LDI r2, 12
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 313
LDI r6, 21
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 341
LDI r11, 71
LDI r12, 105
LDI r13, 90
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
