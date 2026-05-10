; DESCRIPTION: Draws a white rectangle at (329, 29) with width 114 and height 86.
; PLAN: r0=329(x), r1=29(y), r2=114(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 29
LDI r2, 114
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
