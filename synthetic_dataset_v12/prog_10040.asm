; DESCRIPTION: Composite: Creates a red circular shape at (184, 96) with radius 79 then Draws a red rectangle at (270, 69) with width 93 and height 44.
; PLAN: r0=184(x), r1=96(y), r2=79(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=270(x), r6=69(y), r7=93(width), r8=44(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 184
LDI r1, 96
LDI r2, 79
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 270
LDI r6, 69
LDI r7, 93
LDI r8, 44
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
