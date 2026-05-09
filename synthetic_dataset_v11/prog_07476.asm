; DESCRIPTION: Composite: . Then Draws a white rectangle at (9, 53) with width 80 and height 81. Then Renders a orange disk with center (148, 215) and radius 24.
; PLAN: r0=9(x), r1=53(y), r2=80(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=148(x), r1=215(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (9, 53) with width 80 and height 81.
; PLAN: r0=9(x), r1=53(y), r2=80(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 9
LDI r1, 53
LDI r2, 80
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Renders a orange disk with center (148, 215) and radius 24.
; PLAN: r0=148(x), r1=215(y), r2=24(radius), r3=0xFF8800(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 148
LDI r1, 215
LDI r2, 24
LDI r3, 0xFF8800
CIRCLE r0, r1, r2, r3
HALT
