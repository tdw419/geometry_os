; DESCRIPTION: Composite: Places a cyan 86x106 rectangle at position (126, 122) then Creates a orange circular shape at (348, 125) with radius 79 then Sets a single white pixel at (8, 218).
; PLAN: r0=126(x), r1=122(y), r2=86(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=348(x), r6=125(y), r7=79(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=8(x), r11=218(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 126
LDI r1, 122
LDI r2, 86
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 348
LDI r6, 125
LDI r7, 79
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 8
LDI r11, 218
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
