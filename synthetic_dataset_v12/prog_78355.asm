; DESCRIPTION: Composite: Places a white circle of radius 62 at center (421, 108) then Places a cyan dot at position (416, 159) then Places a black 115x69 rectangle at position (249, 166).
; PLAN: r0=421(x), r1=108(y), r2=62(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=416(x), r6=159(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=249(x), r11=166(y), r12=115(width), r13=69(height), r14=0x000000(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 421
LDI r1, 108
LDI r2, 62
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 416
LDI r6, 159
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 249
LDI r11, 166
LDI r12, 115
LDI r13, 69
LDI r14, 0x000000
RECTF r10, r11, r12, r13, r14
HALT
