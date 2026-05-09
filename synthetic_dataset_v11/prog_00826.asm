; DESCRIPTION: Draws a white rectangle at (8, 171) with width 81 and height 49.
; PLAN: r0=8(x), r1=171(y), r2=81(width), r3=49(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 171
LDI r2, 81
LDI r3, 49
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
