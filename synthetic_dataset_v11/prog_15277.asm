; DESCRIPTION: Composite: . Then Renders a orange disk with center (89, 77) and radius 37. Then Draws a white rectangle at (86, 221) with width 88 and height 15.
; PLAN: r0=89(x), r1=77(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=86(x), r1=221(y), r2=88(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a orange disk with center (89, 77) and radius 37.
; PLAN: r0=89(x), r1=77(y), r2=37(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 89
LDI r1, 77
LDI r2, 37
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (86, 221) with width 88 and height 15.
; PLAN: r0=86(x), r1=221(y), r2=88(width), r3=15(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 221
LDI r2, 88
LDI r3, 15
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
