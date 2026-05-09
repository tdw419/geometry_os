; DESCRIPTION: Composite: Places a green 77x63 rectangle at position (421, 32) then Creates a black circular shape at (360, 184) with radius 60 then Sets a single purple pixel at (76, 45).
; PLAN: r0=421(x), r1=32(y), r2=77(width), r3=63(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=360(x), r6=184(y), r7=60(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=76(x), r11=45(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 421
LDI r1, 32
LDI r2, 77
LDI r3, 63
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 360
LDI r6, 184
LDI r7, 60
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
LDI r10, 76
LDI r11, 45
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
