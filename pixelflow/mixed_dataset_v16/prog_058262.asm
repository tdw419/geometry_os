; DESCRIPTION: Draws a white rectangle at (185, 130) with width 100 and height 30.
; PLAN: r0=185(x), r1=130(y), r2=100(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 185
LDI r1, 130
LDI r2, 100
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
