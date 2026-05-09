; DESCRIPTION: Composite: Places a green 64x23 rectangle at position (164, 30) then Creates a cyan circular shape at (259, 224) with radius 10 then Places a orange dot at position (370, 148).
; PLAN: r0=164(x), r1=30(y), r2=64(width), r3=23(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=259(x), r6=224(y), r7=10(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=370(x), r11=148(y), r12=0xFF8800(color). Op: PSET r10, r11, r12.
LDI r0, 164
LDI r1, 30
LDI r2, 64
LDI r3, 23
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 259
LDI r6, 224
LDI r7, 10
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 370
LDI r11, 148
LDI r12, 0xFF8800
PSET r10, r11, r12
HALT
