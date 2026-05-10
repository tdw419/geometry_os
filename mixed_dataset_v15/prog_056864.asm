; DESCRIPTION: Draws a white rectangle at (307, 113) with width 24 and height 81.
; PLAN: r0=307(x), r1=113(y), r2=24(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 307
LDI r1, 113
LDI r2, 24
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
