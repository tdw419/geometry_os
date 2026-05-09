; DESCRIPTION: Composite: Creates a black circular shape at (152, 184) with radius 62 then Places a green 105x25 rectangle at position (257, 115) then Sets a single blue pixel at (11, 52).
; PLAN: r0=152(x), r1=184(y), r2=62(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=257(x), r6=115(y), r7=105(width), r8=25(height), r9=0x00FF00(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=11(x), r11=52(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 152
LDI r1, 184
LDI r2, 62
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 257
LDI r6, 115
LDI r7, 105
LDI r8, 25
LDI r9, 0x00FF00
RECTF r5, r6, r7, r8, r9
LDI r10, 11
LDI r11, 52
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
