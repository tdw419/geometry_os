; DESCRIPTION: Draws a white rectangle at (384, 25) with width 55 and height 116.
; PLAN: r0=384(x), r1=25(y), r2=55(width), r3=116(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 25
LDI r2, 55
LDI r3, 116
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
