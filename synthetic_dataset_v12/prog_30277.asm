; DESCRIPTION: Draws a white rectangle at (384, 77) with width 113 and height 68.
; PLAN: r0=384(x), r1=77(y), r2=113(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 384
LDI r1, 77
LDI r2, 113
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
