; DESCRIPTION: Composite: Creates a black circular shape at (78, 123) with radius 47 then Places a cyan 28x29 rectangle at position (204, 119).
; PLAN: r0=78(x), r1=123(y), r2=47(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=204(x), r6=119(y), r7=28(width), r8=29(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 78
LDI r1, 123
LDI r2, 47
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 204
LDI r6, 119
LDI r7, 28
LDI r8, 29
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
