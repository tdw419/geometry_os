; DESCRIPTION: Composite: Places a black circle of radius 52 at center (239, 105) then Places a purple dot at position (254, 57) then Renders a white box of size 98x117 starting at (364, 93).
; PLAN: r0=239(x), r1=105(y), r2=52(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=254(x), r6=57(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=364(x), r11=93(y), r12=98(width), r13=117(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 239
LDI r1, 105
LDI r2, 52
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 254
LDI r6, 57
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 364
LDI r11, 93
LDI r12, 98
LDI r13, 117
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
