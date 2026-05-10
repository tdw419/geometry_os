; DESCRIPTION: Composite: Creates a black circular shape at (231, 194) with radius 16 then Sets a single orange pixel at (54, 154) then Places a purple 10x108 rectangle at position (186, 11).
; PLAN: r0=231(x), r1=194(y), r2=16(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=54(x), r6=154(y), r7=0xFF8800(color). Op: PSET r5, r6, r7 Next: r10=186(x), r11=11(y), r12=10(width), r13=108(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 231
LDI r1, 194
LDI r2, 16
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 54
LDI r6, 154
LDI r7, 0xFF8800
PSET r5, r6, r7
LDI r10, 186
LDI r11, 11
LDI r12, 10
LDI r13, 108
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
