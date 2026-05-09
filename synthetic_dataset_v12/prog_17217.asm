; DESCRIPTION: Composite: Places a orange 34x18 rectangle at position (53, 18) then Creates a green circular shape at (298, 184) with radius 70.
; PLAN: r0=53(x), r1=18(y), r2=34(width), r3=18(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=298(x), r6=184(y), r7=70(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 53
LDI r1, 18
LDI r2, 34
LDI r3, 18
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 184
LDI r7, 70
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
HALT
