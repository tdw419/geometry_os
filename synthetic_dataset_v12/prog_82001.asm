; DESCRIPTION: Composite: Places a black circle of radius 42 at center (452, 84) then Places a orange 117x116 rectangle at position (273, 104) then Sets a single white pixel at (394, 97).
; PLAN: r0=452(x), r1=84(y), r2=42(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=273(x), r6=104(y), r7=117(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=394(x), r11=97(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 452
LDI r1, 84
LDI r2, 42
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 273
LDI r6, 104
LDI r7, 117
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
LDI r10, 394
LDI r11, 97
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
