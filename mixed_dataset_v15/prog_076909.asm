; DESCRIPTION: Composite: Creates a orange circular shape at (348, 97) with radius 23 then Places a red 57x88 rectangle at position (372, 129) then Sets a single green pixel at (206, 192).
; PLAN: r0=348(x), r1=97(y), r2=23(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=372(x), r6=129(y), r7=57(width), r8=88(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=206(x), r11=192(y), r12=0x00FF00(color). Op: PSET r10, r11, r12.
LDI r0, 348
LDI r1, 97
LDI r2, 23
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 372
LDI r6, 129
LDI r7, 57
LDI r8, 88
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
LDI r10, 206
LDI r11, 192
LDI r12, 0x00FF00
PSET r10, r11, r12
HALT
