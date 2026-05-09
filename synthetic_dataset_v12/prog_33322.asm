; DESCRIPTION: Draws a white rectangle at (176, 141) with width 74 and height 81.
; PLAN: r0=176(x), r1=141(y), r2=74(width), r3=81(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 141
LDI r2, 74
LDI r3, 81
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
