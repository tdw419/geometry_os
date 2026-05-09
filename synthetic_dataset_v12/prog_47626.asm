; DESCRIPTION: Composite: Places a purple 12x45 rectangle at position (179, 100) then Places a black circle of radius 63 at center (280, 86) then Places a white dot at position (30, 102).
; PLAN: r0=179(x), r1=100(y), r2=12(width), r3=45(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=280(x), r6=86(y), r7=63(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=30(x), r11=102(y), r12=0xFFFFFF(color). Op: PSET r10, r11, r12.
LDI r0, 179
LDI r1, 100
LDI r2, 12
LDI r3, 45
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 280
LDI r6, 86
LDI r7, 63
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 30
LDI r11, 102
LDI r12, 0xFFFFFF
PSET r10, r11, r12
HALT
