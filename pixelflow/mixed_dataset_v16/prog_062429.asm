; DESCRIPTION: Composite: Places a black 40x30 rectangle at position (116, 120) then Creates a purple circular shape at (316, 83) with radius 16.
; PLAN: r0=116(x), r1=120(y), r2=40(width), r3=30(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=316(x), r6=83(y), r7=16(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 116
LDI r1, 120
LDI r2, 40
LDI r3, 30
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 316
LDI r6, 83
LDI r7, 16
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
