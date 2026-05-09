; DESCRIPTION: Draws a white rectangle at (113, 3) with width 118 and height 103.
; PLAN: r0=113(x), r1=3(y), r2=118(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 3
LDI r2, 118
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
