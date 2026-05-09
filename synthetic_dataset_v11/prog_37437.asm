; DESCRIPTION: Composite: . Then Draws a white rectangle at (20, 43) with width 75 and height 72. Then Creates a yellow circular shape at (215, 163) with radius 31.
; PLAN: r0=20(x), r1=43(y), r2=75(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r0=215(x), r1=163(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
; DESCRIPTION: Draws a white rectangle at (20, 43) with width 75 and height 72.
; PLAN: r0=20(x), r1=43(y), r2=75(width), r3=72(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 20
LDI r1, 43
LDI r2, 75
LDI r3, 72
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
; DESCRIPTION: Creates a yellow circular shape at (215, 163) with radius 31.
; PLAN: r0=215(x), r1=163(y), r2=31(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 215
LDI r1, 163
LDI r2, 31
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
HALT
