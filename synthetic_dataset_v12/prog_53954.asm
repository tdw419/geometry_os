; DESCRIPTION: Composite: Creates a purple circular shape at (305, 17) with radius 13 then Places a white 88x83 rectangle at position (159, 16).
; PLAN: r0=305(x), r1=17(y), r2=13(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=159(x), r6=16(y), r7=88(width), r8=83(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 305
LDI r1, 17
LDI r2, 13
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 159
LDI r6, 16
LDI r7, 88
LDI r8, 83
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
