; DESCRIPTION: Composite: Creates a black circular shape at (226, 151) with radius 67 then Places a orange 77x85 rectangle at position (326, 54) then Sets a single white pixel at (207, 24).
; PLAN: r0=226(x), r1=151(y), r2=67(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=326(x), r6=54(y), r7=77(width), r8=85(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=207(x), r11=24(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 226
LDI r1, 151
LDI r2, 67
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 326
LDI r6, 54
LDI r7, 77
LDI r8, 85
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 207
LDI r11, 24
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
