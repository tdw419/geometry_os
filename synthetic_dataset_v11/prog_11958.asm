; DESCRIPTION: Composite: . Then Renders a white disk with center (130, 159) and radius 18. Then Draws a red rectangle at (141, 6) with width 23 and height 81.
; PLAN: r0=130(x), r1=159(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=141(x), r1=6(y), r2=23(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (130, 159) and radius 18.
; PLAN: r0=130(x), r1=159(y), r2=18(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 130
LDI r1, 159
LDI r2, 18
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (141, 6) with width 23 and height 81.
; PLAN: r0=141(x), r1=6(y), r2=23(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 141
LDI r1, 6
LDI r2, 23
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
