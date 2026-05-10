; DESCRIPTION: Composite: Places a black 59x43 rectangle at position (380, 139) then Places a white dot at position (87, 183) then Places a black circle of radius 55 at center (454, 126).
; PLAN: r0=380(x), r1=139(y), r2=59(width), r3=43(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=87(x), r6=183(y), r7=0xFFFFFF(color). Op: PSET r5, r6, r7 Next: r10=454(x), r11=126(y), r12=55(radius), r13=0x000000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 380
LDI r1, 139
LDI r2, 59
LDI r3, 43
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 87
LDI r6, 183
LDI r7, 0xFFFFFF
PSET r5, r6, r7
LDI r10, 454
LDI r11, 126
LDI r12, 55
LDI r13, 0x000000
CIRCLE r10, r11, r12, r13
HALT
