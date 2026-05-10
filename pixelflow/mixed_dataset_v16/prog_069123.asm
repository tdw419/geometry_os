; DESCRIPTION: Draws a white rectangle at (265, 29) with width 117 and height 32.
; PLAN: r0=265(x), r1=29(y), r2=117(width), r3=32(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 29
LDI r2, 117
LDI r3, 32
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
