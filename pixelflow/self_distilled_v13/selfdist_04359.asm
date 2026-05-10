; DESCRIPTION: Draws a white rectangle at (72, 29) with width 43 and height 28.
; PLAN: r0=72(x), r1=29(y), r2=43(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 29
LDI r2, 43
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
