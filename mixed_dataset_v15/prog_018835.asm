; DESCRIPTION: Composite: Creates a orange circular shape at (87, 196) with radius 17 then Places a red 11x26 rectangle at position (116, 51).
; PLAN: r0=87(x), r1=196(y), r2=17(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=116(x), r6=51(y), r7=11(width), r8=26(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 87
LDI r1, 196
LDI r2, 17
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 116
LDI r6, 51
LDI r7, 11
LDI r8, 26
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
