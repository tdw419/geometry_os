; DESCRIPTION: Composite: Creates a orange circular shape at (379, 176) with radius 14 then Places a orange 77x86 rectangle at position (397, 3) then Places a purple dot at position (343, 121).
; PLAN: r0=379(x), r1=176(y), r2=14(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=397(x), r6=3(y), r7=77(width), r8=86(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=343(x), r11=121(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 379
LDI r1, 176
LDI r2, 14
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 397
LDI r6, 3
LDI r7, 77
LDI r8, 86
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 343
LDI r11, 121
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
