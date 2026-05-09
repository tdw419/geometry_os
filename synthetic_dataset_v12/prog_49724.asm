; DESCRIPTION: Composite: Places a white circle of radius 25 at center (26, 30) then Places a blue dot at position (141, 175) then Places a blue 69x37 rectangle at position (47, 135).
; PLAN: r0=26(x), r1=30(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=141(x), r6=175(y), r7=0x0000FF(color). Op: PSET r5, r6, r7 Next: r10=47(x), r11=135(y), r12=69(width), r13=37(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 26
LDI r1, 30
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 141
LDI r6, 175
LDI r7, 0x0000FF
PSET r5, r6, r7
LDI r10, 47
LDI r11, 135
LDI r12, 69
LDI r13, 37
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
