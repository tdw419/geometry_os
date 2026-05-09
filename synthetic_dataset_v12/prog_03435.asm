; DESCRIPTION: Composite: Creates a white rectangular region at (282, 128) spanning 75 by 58 pixels then Places a orange circle of radius 27 at center (85, 114) then Places a orange dot at position (228, 115).
; PLAN: r0=282(x), r1=128(y), r2=75(width), r3=58(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=85(x), r6=114(y), r7=27(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=228(x), r11=115(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 282
LDI r1, 128
LDI r2, 75
LDI r3, 58
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 85
LDI r6, 114
LDI r7, 27
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 228
LDI r11, 115
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
