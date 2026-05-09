; DESCRIPTION: Composite: Draws a white rectangle at (11, 98) with width 81 and height 75 then Renders a magenta disk with center (96, 148) and radius 65.
; PLAN: r0=11(x), r1=98(y), r2=81(width), r3=75(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=96(x), r6=148(y), r7=65(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 11
LDI r1, 98
LDI r2, 81
LDI r3, 75
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 96
LDI r6, 148
LDI r7, 65
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
