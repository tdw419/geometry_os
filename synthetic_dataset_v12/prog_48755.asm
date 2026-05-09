; DESCRIPTION: Composite: Draws a orange circle centered at (134, 140) with radius 35 then Draws a orange rectangle at (44, 59) with width 28 and height 52.
; PLAN: r0=134(x), r1=140(y), r2=35(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=44(x), r6=59(y), r7=28(width), r8=52(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 134
LDI r1, 140
LDI r2, 35
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
LDI r5, 44
LDI r6, 59
LDI r7, 28
LDI r8, 52
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
