; DESCRIPTION: Composite: Draws a orange rectangle at (99, 23) with width 47 and height 99 then Renders a orange disk with center (113, 105) and radius 76.
; PLAN: r0=99(x), r1=23(y), r2=47(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=113(x), r6=105(y), r7=76(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 99
LDI r1, 23
LDI r2, 47
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 113
LDI r6, 105
LDI r7, 76
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
HALT
