; DESCRIPTION: Composite: . Then Renders a purple disk with center (72, 92) and radius 14. Then Draws a white rectangle at (191, 20) with width 41 and height 36.
; PLAN: r0=72(x), r1=92(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=191(x), r1=20(y), r2=41(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a purple disk with center (72, 92) and radius 14.
; PLAN: r0=72(x), r1=92(y), r2=14(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 72
LDI r1, 92
LDI r2, 14
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a white rectangle at (191, 20) with width 41 and height 36.
; PLAN: r0=191(x), r1=20(y), r2=41(width), r3=36(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 20
LDI r2, 41
LDI r3, 36
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
