; DESCRIPTION: Composite: Creates a white circular shape at (287, 70) with radius 42 then Sets a single green pixel at (295, 32) then Places a orange 34x52 rectangle at position (318, 12).
; PLAN: r0=287(x), r1=70(y), r2=42(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=295(x), r6=32(y), r7=0x00FF00(color). Op: PSET r5, r6, r7 Next: r10=318(x), r11=12(y), r12=34(width), r13=52(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 287
LDI r1, 70
LDI r2, 42
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 295
LDI r6, 32
LDI r7, 0x00FF00
PSET r5, r6, r7
LDI r10, 318
LDI r11, 12
LDI r12, 34
LDI r13, 52
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
