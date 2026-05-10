; DESCRIPTION: Composite: Draws a blue rectangle at (389, 75) with width 28 and height 76 then Renders a magenta disk with center (79, 92) and radius 66.
; PLAN: r0=389(x), r1=75(y), r2=28(width), r3=76(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=79(x), r6=92(y), r7=66(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 389
LDI r1, 75
LDI r2, 28
LDI r3, 76
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 79
LDI r6, 92
LDI r7, 66
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
