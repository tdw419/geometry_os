; DESCRIPTION: Composite: Draws a red rectangle at (432, 61) with width 68 and height 31 then Places a magenta circle of radius 15 at center (254, 115).
; PLAN: r0=432(x), r1=61(y), r2=68(width), r3=31(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=254(x), r6=115(y), r7=15(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 432
LDI r1, 61
LDI r2, 68
LDI r3, 31
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 254
LDI r6, 115
LDI r7, 15
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
