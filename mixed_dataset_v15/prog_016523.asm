; DESCRIPTION: Composite: Draws a magenta circle centered at (120, 86) with radius 14 then Renders a white box of size 100x43 starting at (156, 157).
; PLAN: r0=120(x), r1=86(y), r2=14(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=156(x), r6=157(y), r7=100(width), r8=43(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 120
LDI r1, 86
LDI r2, 14
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 156
LDI r6, 157
LDI r7, 100
LDI r8, 43
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
