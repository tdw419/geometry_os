; DESCRIPTION: Composite: Draws a red rectangle at (454, 95) with width 28 and height 96 then Renders a purple disk with center (113, 121) and radius 39.
; PLAN: r0=454(x), r1=95(y), r2=28(width), r3=96(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=121(y), r7=39(radius), r8=0xAA00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 454
LDI r1, 95
LDI r2, 28
LDI r3, 96
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 121
LDI r7, 39
LDI r8, 0xAA00FF
CIRCLE r5, r6, r7, r8
HALT
