; DESCRIPTION: Draws a white rectangle at (18, 101) with width 113 and height 45.
; PLAN: r0=18(x), r1=101(y), r2=113(width), r3=45(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 18
LDI r1, 101
LDI r2, 113
LDI r3, 45
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
