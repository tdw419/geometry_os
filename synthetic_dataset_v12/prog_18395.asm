; DESCRIPTION: Composite: Draws a magenta rectangle at (18, 2) with width 48 and height 77 then Creates a black circular shape at (463, 190) with radius 13.
; PLAN: r0=18(x), r1=2(y), r2=48(width), r3=77(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=463(x), r6=190(y), r7=13(radius), r8=0x000000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 18
LDI r1, 2
LDI r2, 48
LDI r3, 77
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 463
LDI r6, 190
LDI r7, 13
LDI r8, 0x000000
CIRCLE r5, r6, r7, r8
HALT
