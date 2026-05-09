; DESCRIPTION: Draws a white rectangle at (107, 55) with width 28 and height 105.
; PLAN: r0=107(x), r1=55(y), r2=28(width), r3=105(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 55
LDI r2, 28
LDI r3, 105
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
