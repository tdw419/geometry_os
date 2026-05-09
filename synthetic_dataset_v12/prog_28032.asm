; DESCRIPTION: Composite: Draws a magenta circle centered at (125, 96) with radius 48 then Draws a purple rectangle at (228, 43) with width 57 and height 10.
; PLAN: r0=125(x), r1=96(y), r2=48(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=228(x), r6=43(y), r7=57(width), r8=10(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 125
LDI r1, 96
LDI r2, 48
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 228
LDI r6, 43
LDI r7, 57
LDI r8, 10
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
