; DESCRIPTION: Draws a white rectangle at (125, 130) with width 86 and height 83.
; PLAN: r0=125(x), r1=130(y), r2=86(width), r3=83(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 125
LDI r1, 130
LDI r2, 86
LDI r3, 83
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
