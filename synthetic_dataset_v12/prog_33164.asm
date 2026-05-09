; DESCRIPTION: Draws a white rectangle at (384, 33) with width 116 and height 78.
; PLAN: r0=384(x), r1=33(y), r2=116(width), r3=78(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 33
LDI r2, 116
LDI r3, 78
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
