; DESCRIPTION: Composite: Places a white 83x101 rectangle at position (85, 61) then Places a orange circle of radius 68 at center (368, 132) then Sets a single black pixel at (63, 240).
; PLAN: r0=85(x), r1=61(y), r2=83(width), r3=101(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=368(x), r6=132(y), r7=68(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=63(x), r11=240(y), r12=0x000000(color). Op: PSET r10, r11, r12.
LDI r0, 85
LDI r1, 61
LDI r2, 83
LDI r3, 101
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 132
LDI r7, 68
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 63
LDI r11, 240
LDI r12, 0x000000
PSET r10, r11, r12
HALT
