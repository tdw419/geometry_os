; DESCRIPTION: Composite: Draws a green rectangle at (156, 179) with width 81 and height 64 then Creates a orange circular shape at (286, 101) with radius 31.
; PLAN: r0=156(x), r1=179(y), r2=81(width), r3=64(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=286(x), r6=101(y), r7=31(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 156
LDI r1, 179
LDI r2, 81
LDI r3, 64
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
LDI r5, 286
LDI r6, 101
LDI r7, 31
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
