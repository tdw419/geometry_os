; DESCRIPTION: Composite: Renders a black disk with center (321, 203) and radius 47 then Places a orange dot at position (486, 62) then Places a cyan 35x119 rectangle at position (421, 69).
; PLAN: r0=321(x), r1=203(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=486(x), r6=62(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=421(x), r11=69(y), r12=35(width), r13=119(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 321
LDI r1, 203
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 486
LDI r6, 62
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 421
LDI r11, 69
LDI r12, 35
LDI r13, 119
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
