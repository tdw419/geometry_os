; DESCRIPTION: Draws a white rectangle at (342, 130) with width 62 and height 91.
; PLAN: r0=342(x), r1=130(y), r2=62(width), r3=91(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 130
LDI r2, 62
LDI r3, 91
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
