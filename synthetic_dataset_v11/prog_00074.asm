; DESCRIPTION: Draws a white rectangle at (90, 130) with width 97 and height 61.
; PLAN: r0=90(x), r1=130(y), r2=97(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 130
LDI r2, 97
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
