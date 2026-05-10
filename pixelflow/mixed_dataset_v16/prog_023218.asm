; DESCRIPTION: Composite: Places a red 55x76 rectangle at position (310, 124) then Renders a black disk with center (98, 203) and radius 49 then Places a orange dot at position (161, 170).
; PLAN: r0=310(x), r1=124(y), r2=55(width), r3=76(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=98(x), r6=203(y), r7=49(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=161(x), r11=170(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 310
LDI r1, 124
LDI r2, 55
LDI r3, 76
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 98
LDI r6, 203
LDI r7, 49
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 161
LDI r11, 170
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
