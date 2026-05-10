; DESCRIPTION: Composite: Places a red 50x35 rectangle at position (457, 17) then Creates a orange circular shape at (324, 210) with radius 28.
; PLAN: r0=457(x), r1=17(y), r2=50(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=324(x), r6=210(y), r7=28(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 457
LDI r1, 17
LDI r2, 50
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 324
LDI r6, 210
LDI r7, 28
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
