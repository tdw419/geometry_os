; DESCRIPTION: Draws a white rectangle at (123, 136) with width 113 and height 32.
; PLAN: r0=123(x), r1=136(y), r2=113(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 123
LDI r1, 136
LDI r2, 113
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
