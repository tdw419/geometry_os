; DESCRIPTION: Composite: . Then Renders a white disk with center (40, 47) and radius 24. Then Draws a yellow rectangle at (20, 147) with width 98 and height 86.
; PLAN: r0=40(x), r1=47(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r0=20(x), r1=147(y), r2=98(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
; DESCRIPTION: Renders a white disk with center (40, 47) and radius 24.
; PLAN: r0=40(x), r1=47(y), r2=24(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 40
LDI r1, 47
LDI r2, 24
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
; DESCRIPTION: Draws a yellow rectangle at (20, 147) with width 98 and height 86.
; PLAN: r0=20(x), r1=147(y), r2=98(width), r3=86(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 147
LDI r2, 98
LDI r3, 86
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
