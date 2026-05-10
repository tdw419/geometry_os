; DESCRIPTION: Composite: Places a purple 59x34 rectangle at position (376, 198) then Creates a black circular shape at (253, 164) with radius 37.
; PLAN: r0=376(x), r1=198(y), r2=59(width), r3=34(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=253(x), r6=164(y), r7=37(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 376
LDI r1, 198
LDI r2, 59
LDI r3, 34
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 253
LDI r6, 164
LDI r7, 37
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
