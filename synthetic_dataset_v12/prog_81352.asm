; DESCRIPTION: Composite: Creates a red circular shape at (159, 77) with radius 57 then Places a magenta 108x49 rectangle at position (85, 136).
; PLAN: r0=159(x), r1=77(y), r2=57(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=85(x), r6=136(y), r7=108(width), r8=49(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 159
LDI r1, 77
LDI r2, 57
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 85
LDI r6, 136
LDI r7, 108
LDI r8, 49
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
