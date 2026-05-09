; DESCRIPTION: Composite: . Then Draws a red rectangle at (191, 176) with width 38 and height 64. Then Renders a orange disk with center (195, 75) and radius 52.
; PLAN: r0=191(x), r1=176(y), r2=38(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=195(x), r1=75(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a red rectangle at (191, 176) with width 38 and height 64.
; PLAN: r0=191(x), r1=176(y), r2=38(width), r3=64(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 191
LDI r1, 176
LDI r2, 38
LDI r3, 64
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (195, 75) and radius 52.
; PLAN: r0=195(x), r1=75(y), r2=52(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 195
LDI r1, 75
LDI r2, 52
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
