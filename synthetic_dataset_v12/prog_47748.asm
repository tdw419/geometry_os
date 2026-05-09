; DESCRIPTION: Composite: Sets a single green pixel at (425, 26) then Creates a white circular shape at (231, 85) with radius 64 then Places a cyan 75x109 rectangle at position (203, 21).
; PLAN: r0=425(x), r1=26(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=231(x), r6=85(y), r7=64(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=203(x), r11=21(y), r12=75(width), r13=109(height), r14=0x00FFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 425
LDI r1, 26
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 231
LDI r6, 85
LDI r7, 64
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
LDI r10, 203
LDI r11, 21
LDI r12, 75
LDI r13, 109
LDI r14, 0x00FFFF
RECTF r10, r11, r12, r13, r14
HALT
