; DESCRIPTION: Draws a white rectangle at (244, 122) with width 105 and height 61.
; PLAN: r0=244(x), r1=122(y), r2=105(width), r3=61(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 122
LDI r2, 105
LDI r3, 61
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
