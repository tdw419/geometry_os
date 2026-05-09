; DESCRIPTION: Composite: Creates a black circular shape at (416, 178) with radius 44 then Sets a single orange pixel at (126, 86) then Places a purple 62x61 rectangle at position (212, 65).
; PLAN: r0=416(x), r1=178(y), r2=44(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=126(x), r6=86(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=212(x), r11=65(y), r12=62(width), r13=61(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 416
LDI r1, 178
LDI r2, 44
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 126
LDI r6, 86
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 212
LDI r11, 65
LDI r12, 62
LDI r13, 61
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
