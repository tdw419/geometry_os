; DESCRIPTION: Composite: Creates a yellow circular shape at (310, 88) with radius 37 then Places a red 18x70 rectangle at position (109, 31).
; PLAN: r0=310(x), r1=88(y), r2=37(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=109(x), r6=31(y), r7=18(width), r8=70(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 88
LDI r2, 37
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 109
LDI r6, 31
LDI r7, 18
LDI r8, 70
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
