; DESCRIPTION: Composite: Renders a purple disk with center (88, 168) and radius 74 then Draws a white rectangle at (183, 74) with width 96 and height 78.
; PLAN: r0=88(x), r1=168(y), r2=74(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=183(x), r6=74(y), r7=96(width), r8=78(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 88
LDI r1, 168
LDI r2, 74
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 183
LDI r6, 74
LDI r7, 96
LDI r8, 78
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
HALT
