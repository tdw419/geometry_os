; DESCRIPTION: Composite: Draws a orange rectangle at (203, 80) with width 29 and height 44 then Renders a red disk with center (138, 180) and radius 30.
; PLAN: r0=203(x), r1=80(y), r2=29(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=138(x), r6=180(y), r7=30(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 203
LDI r1, 80
LDI r2, 29
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 180
LDI r7, 30
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
HALT
