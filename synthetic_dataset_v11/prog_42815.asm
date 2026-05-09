; DESCRIPTION: Composite: . Then Renders a white disk with center (117, 95) and radius 66. Then Draws a red rectangle at (129, 40) with width 70 and height 106.
; PLAN: r0=117(x), r1=95(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=129(x), r1=40(y), r2=70(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (117, 95) and radius 66.
; PLAN: r0=117(x), r1=95(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 117
LDI r1, 95
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a red rectangle at (129, 40) with width 70 and height 106.
; PLAN: r0=129(x), r1=40(y), r2=70(width), r3=106(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 129
LDI r1, 40
LDI r2, 70
LDI r3, 106
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
